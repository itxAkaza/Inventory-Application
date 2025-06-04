import 'package:flutter/material.dart';

class MySmallContainer extends StatelessWidget {
  final String myimagepath;

  const MySmallContainer({super.key,
    required this.myimagepath

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 2),
      child: Container(
        height: 36,
        width: 36,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(0,5)
              ),
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(-3,3)
              ),
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(3,3)
              ),


            ]


        ),

        child: Center(
          child: Image(
            image: AssetImage(myimagepath),
          ),
        ),

      ),
    );
  }
}
