import 'package:flutter/material.dart';

import 'My_Vertical_Popover.dart';


class MyDropdownMenu extends StatelessWidget {

  final String SelectCategory;
  final Function(String) OnCategorySelected;


  const MyDropdownMenu({super.key,
    required this.SelectCategory,
    required this.OnCategorySelected
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,

      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.purpleAccent,
              width: 1.5
          ),
          borderRadius: BorderRadius.circular(8)
      ),
      padding:const  EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,


        children: [
          Container(


            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 8),
              child: Text(

                SelectCategory,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                ),

              ),
            ),

          ),

          MyVerticalPopover(OnSelect:OnCategorySelected ,),
        ],
      ),
    );
  }
}
