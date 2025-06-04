import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:inventroysystem/Components/MY_DropDown_Menu.dart';
import 'package:inventroysystem/Components/My_AddScreen_Button.dart';
import 'package:inventroysystem/Components/My_Add_TexFormField.dart';
import 'package:inventroysystem/Components/My_Vertical_Popover.dart';
import 'package:inventroysystem/Components/Text_Field.dart';

import '../FireBase_Services/Inventory_Services.dart';
import '../utils.dart';

class AddInventoryScreen extends StatefulWidget {
  const AddInventoryScreen({super.key});

  @override
  State<AddInventoryScreen> createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen> {





  final ItemNameController=TextEditingController();
  final ItemQuantityController=TextEditingController();
  final ItempriceController=TextEditingController();


  final InventoryService invetorySerice=InventoryService();




  String _SelectedCategory="Select Category";


  AddItem()async
  {
    String IQs = ItemQuantityController.text;
    int IQ = int.tryParse(IQs) ?? 0;

    String Ipric = ItempriceController.text;
    double Iprice = double.tryParse(Ipric) ?? 0.0;


    try
    {
      await invetorySerice.ADDorUpdateInventory(
          _SelectedCategory,
          ItemNameController.text.toString(),
          IQ,
          Iprice
      );

      Utils().toastMessegessuccess("Item Added Successfully");
      TextClear();

    }
    catch(e)
    {
      Utils().toastMesseges(e.toString());

    }

  }


  TextClear()
  {
    ItemNameController.clear();
    ItemQuantityController.clear();
    ItempriceController.clear();

  }


  void updateCategory(String Category)
  {
    setState(() {
      _SelectedCategory=Category;
    });
  }

  final Map<String, Color> categoryColors = {
    "Games": Colors.purple,
    "Electronics": Colors.grey,
    "Grocery": Colors.cyan,
    "Sports Equipment": Colors.orange,
    "Pharmacy": Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
       children: [
         Container(
           decoration:const  BoxDecoration(
             image: DecorationImage(
                 image: AssetImage("assets/additemscreen.png"),
                 fit: BoxFit.cover
             ),
           ),
           child: Scaffold(
             backgroundColor: Colors.transparent,
             body: Center(
               child: BackdropFilter(
                 filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
                 child: Container(
                   height: 350,
                   width: 300,
                   decoration: BoxDecoration(
                       gradient: const LinearGradient(
                           begin:  Alignment.topLeft,
                           end: Alignment.bottomCenter,
                           colors: [Colors.white60,Colors.white10]
                       ),

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
                       )]
                   ),


                   child: Column(


                     children: [
                       const SizedBox(height: 10,),

                       Icon(
                         FontAwesome.github_alt_brand,
                         size: 40,
                         color: categoryColors[_SelectedCategory] ,
                       ),

                       const SizedBox(height: 10,),

                       const Padding(
                         padding:  EdgeInsets.only(left: 30),
                         child: Align(
                             alignment: Alignment.centerLeft,
                             child: Text(
                               "Item Name :",
                               style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)
                         ),
                       ),


                       MyAddTexformfield(
                         Controller: ItemNameController,
                         hintText: "Item Name",
                       ),

                       const Padding(
                         padding:  EdgeInsets.only(left: 30),
                         child: Align(
                             alignment: Alignment.centerLeft,
                             child: Text(
                               "Categories :",
                               style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)
                         ),
                       ),

                       const SizedBox(height: 10,),

                       MyDropdownMenu(
                           SelectCategory: _SelectedCategory,
                           OnCategorySelected: updateCategory
                       ),
                       const SizedBox(height: 10,),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [

                           Column(
                             children: [
                               const Padding(
                                 padding:  EdgeInsets.only(left: 5),
                                 child: Align(
                                     alignment: Alignment.centerLeft,
                                     child: Text(
                                       "Price :",
                                       style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,),)
                                 ),
                               ),

                               MyAddTexformfield(
                                 Controller: ItempriceController,
                                 width: 70,
                                 keyboardtype: TextInputType.number,
                               ),
                             ],
                           ),

                           Column(
                             children: [
                               const Padding(
                                 padding:  EdgeInsets.only(left: 8),
                                 child: Align(
                                     alignment: Alignment.centerLeft,
                                     child: Text(
                                       "Quantity :",
                                       style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)
                                 ),
                               ),

                               MyAddTexformfield(
                                 Controller: ItemQuantityController,
                                 width: 70,
                                 keyboardtype: TextInputType.number,
                               ),
                             ],
                           )


                         ],
                       ),


                     ],
                   ),
                 ),
               ),
             ),
           ),
         ),

         Positioned(
           top: 560,
           left: 100,
           child: Row(
             children: [
               MYAddScreenButton(
                   title: "Save",
                   Ficon: FontAwesome.rotate_left_solid,

                   onTap: TextClear
               ),
               MYAddScreenButton(
                   title: "Cancel",
                   Ficon: FontAwesome.check_solid,
                   onTap:AddItem
               )
             ],
           ),
         )


       ],
    );
  }
}
