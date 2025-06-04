import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventroysystem/Authentications/Sign_Up_Screen.dart';
import 'package:inventroysystem/Components/_My_small_Container.dart';
import 'package:inventroysystem/Components/Round_Button.dart';
import 'package:inventroysystem/Components/Text_Field.dart';
import 'package:inventroysystem/FireBase_Services/Authention_Services.dart';
import 'package:inventroysystem/Screens/Home_Screen.dart';

import '../utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    bool eyecheck = false;

    AuthentionServices authentionServices=AuthentionServices();
    void signin() async {


      try
      {
        UserCredential usercredit= await authentionServices.signinWithEmailPassword(
          emailcontroller.text.toString(),
          passwordcontroller.text.toString(),

        );

        Utils().toastMessegessuccess("Welcome ${usercredit.user!.email}!");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

      }
      catch(e)
      {

        Utils().toastMesseges(e.toString());


      }

    }

    return GestureDetector(
      onTap: (){

        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                image: AssetImage("assets/logoap .png"),
                height: 280,
                width: 280,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 19),
                  child:  Text("Sign in",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color(0xff471AA0))),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              My_TextFormField(
                  obscure: false,
                  hintText: "Email",
                  LabelText: "Email",
                  Controller: emailcontroller,
                  PreIcon: Icons.person),
              My_TextFormField(
                  obscure: true,
                  hintText: "Password",
                  LabelText: "Password",
                  Controller: passwordcontroller,
                  PreIcon: Icons.lock_open),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forget Password ?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xff471AA0))),
                ),
              ),
              RoundButton(title: "Sign in", onTap: signin),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Or sign in with",
                style: TextStyle(color: Color(0xff471AA0), fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  MySmallContainer(
                      myimagepath: "assets/googleicon.png"
                  ),

                  MySmallContainer(
                      myimagepath: "assets/facebookicon.png"
                  ),

                  MySmallContainer(
                      myimagepath: "assets/twittericon.png"
                  ),

                  MySmallContainer(
                      myimagepath: "assets/linkedinicon.png"
                  ),


                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account ?",
                    style: TextStyle(color: Color(0xff471AA0), fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Color(0xff471AA0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
