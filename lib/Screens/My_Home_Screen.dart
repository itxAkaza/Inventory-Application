import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:inventroysystem/Authentications/Sign_In_Screen.dart';
import 'package:inventroysystem/Components/My_Show_Data_Home.dart';
import 'package:inventroysystem/FireBase_Services/Authention_Services.dart';
import 'package:inventroysystem/FireBase_Services/Inventory_Services.dart';
import 'package:inventroysystem/Screens/Show_ItemDetail_Screen.dart';

import '../utils.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  final InventoryService _inventoryService = InventoryService();
  final AuthentionServices authser=AuthentionServices();

  String getuseremail()
  {
    final useremail=_inventoryService.useremail.toString();
    return useremail;

  }



  void logoutuser()async
  {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.purple[45], // Light purple for dialog background
        title: const Text('Confirm Logout', style: TextStyle(color: Colors.purple)),
        content: const Text('Are you sure you want to log out?', style: TextStyle(color: Colors.black87)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.cancel, color: Colors.purple, size: 16),
                SizedBox(width: 4),
                Text('Cancel', style: TextStyle(color: Colors.purple)),
              ],
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.logout, color: Colors.red, size: 16),
                SizedBox(width: 4),
                Text('Logout', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ],
      ),
    );

   if(confirm==true)
     {
       try
       {

         authser.SignOut();

         Utils().toastMessegessuccess("Signing out");
         Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

       }
       catch(e)
       {

         Utils().toastMesseges(e.toString());


       }

     }
  }

  final Map<String, String> categoryImage = {
    "Games": "assets/GameCatimage.png",
    "Electronics": "assets/ElecCatimage.png",
    "Grocery": "assets/GrocCatimage.png",
    "Sports Equipment": "assets/SportCatimage.png",
    "Pharmacy": "assets/PharCatimage.png",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5EFFF),

      body: Column(
        children: [
          const SizedBox(height: 60,),

          Container(
            height: 145,
            width: 340,

            decoration: BoxDecoration(

              image: const DecorationImage(
                  image: AssetImage("assets/backmainimage.png"),
                  fit: BoxFit.cover,
                opacity: 0.8
              ),


              border: Border.all(
                color: Colors.black12,
                    width:2
              ),

              borderRadius: BorderRadius.circular(8),


            ),
            child:Column(
              children: [
                Row(

                  children: [
                    const Text("Add Inventory - ",
                      style: TextStyle(
                          fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black
                      ),),
                    SizedBox(
                      height: 30,
                      child: AnimatedTextKit(
                        repeatForever: true,

                        animatedTexts: [
                          RotateAnimatedText(
                            "Manege Your Stock ",
                            textStyle: const TextStyle(
                                fontSize: 22,fontFamily: "KeaniaOne",color: Colors.black
                            ),

                          ),

                          RotateAnimatedText(
                              "Track Your Items ",
                              textStyle:const  TextStyle(
                                  fontSize: 22,fontFamily: "KeaniaOne",color: Colors.black
                              )

                          ),

                          RotateAnimatedText(
                              "Stay Organized",
                              textStyle:const  TextStyle(
                                  fontSize: 22,fontFamily: "KeaniaOne",color: Colors.black
                              )

                          )

                        ],
                      ),
                    )

                  ],
                ),

                const SizedBox(height: 10,),

                Container(
                  height: 90,
                  width: 240,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.37),

                      border: Border.all(
                          color: Colors.white30,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 25,
                          spreadRadius: 10
                      )],

                  ),
                  child: Column(

                    children: [
                     Row(

                       children: [
                         const SizedBox(width: 80,),
                         const Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 20,fontFamily: "KeaniaOne",color: Colors.orange,fontWeight: FontWeight.bold),

                          ),
                         const SizedBox(width: 30,),
                         IconButton(onPressed: logoutuser,
                             icon: Icon(Icons.logout_outlined,size: 20,color: Colors.red,))
                       ],
                     ),

                      Row(
                        children: [
                          const SizedBox(width: 20,),

                          const Text("Name :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),

                          ),
                          FutureBuilder(
                          future: _inventoryService.Username(),
                          builder: (context, usernameSnapshot)
                              {
                                final username=usernameSnapshot.data?? "Unknown User";
                                return Text(username,style: const TextStyle(fontSize: 15),);

                              }
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          const SizedBox(width: 20,),

                          const Text("Email :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),

                          Text(getuseremail(),style: TextStyle(fontSize: 15),),
                        ],
                      )



                    ],
                  ),
                )




              ],
            ),

          ),
          const SizedBox(height: 8,),
          Expanded(
            flex: 3,
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _inventoryService.categoryStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
            
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error loading inventory: ${snapshot.error}'),
                  );
                }
            
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Nothing in the inventory'));
                }
            
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final category = snapshot.data![index];
                      return MyShowDataHome(
                          Catename: category['name']=="Sports Equipment"?"Sports":category['name'],
                          Asimage: categoryImage[category['name']]??"assets/logoap .png",
                          TotalItems: category['totalItems'].toString(),
                          TotalPrice: category['totalPrice'].toStringAsFixed(2),
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowItemdetailScreen(CategoryName:category['name'].toString() )));
                        },

                      );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}