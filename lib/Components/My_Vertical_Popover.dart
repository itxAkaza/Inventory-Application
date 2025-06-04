import 'package:flutter/material.dart';
import 'package:inventroysystem/Components/Category_List.dart';
import 'package:popover/popover.dart';

class MyVerticalPopover extends StatelessWidget {
  final Function(String) OnSelect;
  const MyVerticalPopover({super.key,required this.OnSelect});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          showPopover(
              context: context,
              bodyBuilder: (context)=>CategoryList(OnSelect: OnSelect,),
            height: 200,
            width: 200,
            direction: PopoverDirection.top,
            backgroundColor: Colors.deepPurpleAccent.shade100,

          );
        },
        icon: const Icon(Icons.more_vert)
    );
  }
}
