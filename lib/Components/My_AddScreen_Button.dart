import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';


class MYAddScreenButton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  final FontAwesomeIconData  Ficon ;


  const MYAddScreenButton({super.key,
    required this.title,
    required this.onTap,
    required this.Ficon,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Container(
          height: 50,
          width: 50,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  begin:  Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white38,Colors.white10]
              ),

              color: Colors.purple,


              border: Border.all(
                  color: Colors.white24,
                  width: 2
              ),

              boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 25,
                  spreadRadius: 10
              )]
          ),
          child: Center(child: Icon(Ficon)),
        ),
      ),
    );
  }
}
