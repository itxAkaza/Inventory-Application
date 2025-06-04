import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventroysystem/Authentications/Sign_In_Screen.dart';
import 'package:inventroysystem/Screens/Home_Screen.dart';


class SplahServices
{


  void isLogin(BuildContext context)
  {
    final auth =FirebaseAuth.instance;
    final user=auth.currentUser;

    if(user!=null)
      {
        Timer(Duration(seconds: 4),()=>Navigator.push(context ,MaterialPageRoute(builder: (context)=>HomeScreen())));

      }
    else
      {
        Timer(Duration(seconds: 4),()=>Navigator.push(context ,MaterialPageRoute(builder: (context)=>SignInScreen())));
      }

  }

}