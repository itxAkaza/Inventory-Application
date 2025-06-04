


import 'package:flutter/material.dart';
import 'package:inventroysystem/Authentications/Sign_In_Screen.dart';
import 'package:inventroysystem/Components/Round_Button.dart';
import 'package:inventroysystem/Components/Text_Field.dart';
import 'package:inventroysystem/FireBase_Services/Authention_Services.dart';
import 'package:inventroysystem/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    final confirmpasswordcontroller=TextEditingController();
    final FullnameController=TextEditingController();

    AuthentionServices authentionServices=AuthentionServices();


    void signup() {

      if(passwordcontroller.text.toString()==confirmpasswordcontroller.text.toString())
        {
          try
          {
            authentionServices.signUpWithEmailPassword(
                emailcontroller.text.toString(),
                passwordcontroller.text.toString(),
                FullnameController.text.toString()
            );

            Utils().toastMessegessuccess("User created Succeffuly");
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

          }
          catch(e)
      {

        Utils().toastMesseges(e.toString());


      }

        }
      else
        {
          Utils().toastMesseges("Password and Confirm Password is not same!!");
        }

    }

    return Container(

        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/Signupdes.png"),
        fit: BoxFit.cover
        )
    ),


    child: GestureDetector(

      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,


          body: Center(
            child: SingleChildScrollView(
              child: Column(


                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  const SizedBox(
                    height: 55,
                  ),

                  Row(
                    children: [

                      IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff471AA0),


                          )
                      ),
                      Text(
                          "Back",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xff471AA0))),

                    ],

                  ),

                  const SizedBox(height: 50,),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 19),
                      child: const Text("Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color(0xff471AA0))),
                    ),
                  ),

                  const SizedBox(height: 14,),

                  My_TextFormField(
                      obscure: false,
                      hintText: "Full Name",
                      LabelText: "Full Name",
                      Controller: FullnameController,
                      PreIcon: Icons.person),

                  My_TextFormField(
                      obscure: false,
                      hintText: "Email",
                      LabelText: "Email",
                      Controller: emailcontroller,
                      PreIcon: Icons.mail),

                  My_TextFormField(
                      obscure: true,
                      hintText: "Password",
                      LabelText: "Password",
                      Controller: passwordcontroller,
                      PreIcon: Icons.lock),

                  My_TextFormField(
                      obscure: true,
                      hintText: "Confirm Password",
                      LabelText: "Confirm Password",
                      Controller: confirmpasswordcontroller,
                      PreIcon: Icons.lock),

                  const SizedBox(height: 40,),



                  RoundButton(
                      title: "Sign up",
                      onTap: signup
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account ?",
                        style: TextStyle(color: Color(0xff471AA0), fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          },
                          child: Text(
                            "Sign In",
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
        ),
    ),
    );
  }
}
