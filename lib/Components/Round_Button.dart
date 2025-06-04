import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;



  const RoundButton({super.key,
  required this.title,
    required this.onTap,


  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Container(
          height: 50,
          width: 390,

          decoration: BoxDecoration(
            color: Color(0xffBB84E8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}
