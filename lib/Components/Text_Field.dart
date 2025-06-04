import 'package:flutter/material.dart';


class My_TextFormField extends StatelessWidget {
  final String hintText;
  final String LabelText;
  final TextEditingController Controller;
  final bool obscure;
  final IconData PreIcon;

  const My_TextFormField({super.key,
    required this.obscure,
    required this.hintText,
    required this.LabelText,
    required this.Controller,
    required this.PreIcon


  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      child: TextFormField(

      controller :Controller,
        obscureText: obscure,

        decoration: InputDecoration(
          //inside text
          hintText:hintText,
          //uper text
          labelText: LabelText,

          //when not foucus
          enabledBorder: OutlineInputBorder(
            borderSide:BorderSide(
              color: Color(0xff9747FF),
              width: 2
            ),
            borderRadius: BorderRadius.circular(10)

          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff9747FF),
              width: 2
            ),
              borderRadius: BorderRadius.circular(10)
          ),

            prefixIcon: Icon(PreIcon),
            prefixIconColor: Color(0xff471AA0)



        ),



      ),
    );
  }
}
