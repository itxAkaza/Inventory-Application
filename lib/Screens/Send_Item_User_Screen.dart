import 'package:flutter/material.dart';

class SendItemUserScreen extends StatefulWidget {
  const SendItemUserScreen({super.key});

  @override
  State<SendItemUserScreen> createState() => _SendItemUserScreenState();
}

class _SendItemUserScreenState extends State<SendItemUserScreen> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(12),
          color: Colors.purpleAccent

        ),
      ),
    );
  }
}
