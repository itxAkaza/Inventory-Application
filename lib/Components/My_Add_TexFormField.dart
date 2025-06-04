import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';


class MyAddTexformfield extends StatelessWidget {

  final String hintText;
  final TextEditingController Controller;
  final TextInputType keyboardtype;

  final double width;
  final FontAwesomeIconData ? PreIcon ;

  const MyAddTexformfield({super.key,
    required this.Controller,
    this.hintText="",
    this.keyboardtype=TextInputType.text,
    this.width=250,
    this.PreIcon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      child: Container(
        width:width,

        child: TextFormField(

          controller :Controller,
          keyboardType: keyboardtype,


          decoration: InputDecoration(

            //inside text
              hintText:hintText,

              //when not foucus
              enabledBorder: OutlineInputBorder(
                  borderSide:const BorderSide(
                      color: Colors.purpleAccent,
                      width: 2
                  ),
                  borderRadius: BorderRadius.circular(12)

              ),

              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.purpleAccent,
                      width: 2
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
            
            prefixIcon: PreIcon != null ? Icon(PreIcon,size: 18,) :null,





          ),



        ),
      ),
    );
  }
}
