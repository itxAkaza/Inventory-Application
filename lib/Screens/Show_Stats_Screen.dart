import 'package:flutter/material.dart';

class ShowStatsScreen extends StatefulWidget {
  const ShowStatsScreen({super.key});

  @override
  State<ShowStatsScreen> createState() => _ShowStatsScreenState();
}

class _ShowStatsScreenState extends State<ShowStatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Stats")),
    );
  }
}
