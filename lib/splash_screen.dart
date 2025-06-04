import 'package:flutter/material.dart';
import 'package:inventroysystem/Splah_Services.dart';



class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}




class _splashscreenState extends State<splashscreen> {

  SplahServices Sserivce=SplahServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Sserivce.isLogin(context);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/spla.png"),
          fit: BoxFit.cover
        ),

      ),

      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 135,),
            Padding(
              padding:  EdgeInsets.only(left: 25),
              child: Center(child: Text("Inventory Expert",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Color(0xff471AA0)),)),
            )
          ],
        ),

      ),
    );
  }
}
