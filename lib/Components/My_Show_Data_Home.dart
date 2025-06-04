import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MyShowDataHome extends StatelessWidget {

  final String Catename;
  final String TotalPrice;
  final String Asimage;
  final String TotalItems;
  final VoidCallback onTap;

  const MyShowDataHome({super.key,
    required this.Catename,
    required this.Asimage,
    required this.TotalItems,
    required this.TotalPrice,
    required this.onTap

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
            child: Container(
              height: 150,
              width: 150,

              decoration: BoxDecoration(

                image: DecorationImage(
                    image: AssetImage(Asimage),
                  fit: BoxFit.cover
                ),
                border: Border.all(
                  width: 2,
                  color: Colors.black26
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 18,


                  )
                ]
              ),

            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25,),
                Row(
                  children: [
                    const Text("Stock :",
                      style:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(TotalItems,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                   const  Text("Category :",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(Catename,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Total Value :",
                      style:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(TotalPrice,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),

                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                       color: Color(0xffBB84E8),
                      )
                      ,
                      child: Center(child: Text("Aailable",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                    const SizedBox(
                      width: 4,
                    ),

                    InkWell(
                      onTap: onTap,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xffD7B9F5),
                        )
                        ,
                        child: const Center(
                            child: Icon(
                              FontAwesome.chevron_right_solid,
                              color: Colors.black38,
                              size: 19,

                        ))),
                    ),


                  ],
                )
            
              ],
            ),
          )
        ],
      ),
    );
  }
}
