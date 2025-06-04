import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final Function(String) OnSelect;
  const CategoryList({super.key,required this.OnSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        InkWell(
          onTap: (){
          OnSelect("Games");
          Navigator.pop(context);
        },
          child: Container(
            height: 40,
            width: 200,
            color: Colors.purple[200],
            child:const  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Games",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(width: 100,),
                Icon(Icons.videogame_asset,color: Colors.white,)
              ],
            ),
          ),
        ),

        InkWell(
          onTap: (){
            OnSelect("Electronics");
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 200,

            child: Container(
              height: 40,
              width: 200,
              color: Colors.grey[200],
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Electronics",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w300),),
                  SizedBox(width: 80,),
                  Icon(Icons.devices  ,color: Colors.black,)
                ],
              ),
            ),
          ),
        ),

        InkWell(
          onTap: (){
            OnSelect("Grocery");
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 200,

            child: Container(
              height: 40,
              width: 200,
              color: Colors.cyan[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Grocery",style: TextStyle(color: Colors.green[900],fontSize: 15,fontWeight: FontWeight.w300),),
                 const SizedBox(width: 100,),
                  Icon(Icons.local_grocery_store_outlined  ,color: Colors.brown[700],)
                ],
              ),
            ),
          ),
        ),

        InkWell(
          onTap: (){
            OnSelect("Sports Equipment");
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 200,

            child: Container(
              height: 40,
              width: 200,

              child: Container(
                height: 40,
                width: 200,
                color: Colors.orangeAccent[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sports Equipment",style: TextStyle(color: Colors.red[800],fontSize: 15,fontWeight: FontWeight.w300),),
                    const SizedBox(width: 40,),
                    Icon(Icons.sports_soccer_outlined  ,color: Colors.blue[900],)
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            OnSelect("Pharmacy");
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 200,

            child: Container(
              height: 40,
              width: 200,
              color: Colors.green[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pharmacy",style: TextStyle(color: Colors.purple[900],fontSize: 15,fontWeight: FontWeight.w300),),
                 const SizedBox(width: 90,),
                  Icon(Icons.local_pharmacy_outlined  ,color: Colors.pink[700],)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
