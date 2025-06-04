import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inventroysystem/Screens/Add_Inventory_Screen.dart';
import 'package:inventroysystem/Screens/My_Home_Screen.dart';
import 'package:inventroysystem/Screens/Send_Item_User_Screen.dart';
import 'package:inventroysystem/Screens/Show_Stats_Screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedindex=0;

  void _NavigateBottomBar(int index)
  {
    setState(() {
      _selectedindex=index;
    });
  }

  final List<Widget> _pages=[
    MyHomeScreen(),
    AddInventoryScreen(),
    ShowStatsScreen(),
    SendItemUserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedindex],


      bottomNavigationBar:Container(
        color: Colors.grey.shade50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),

          child: GNav(

            onTabChange:_NavigateBottomBar,
            selectedIndex: _selectedindex,

            color: Colors.black,// Button color
            backgroundColor: Colors.grey.shade50,//actual back color
            tabBackgroundColor: Colors.deepPurple.shade50,//on tap of icon color
            activeColor: Colors.purple,//color of text
            padding: const EdgeInsets.all(16),

            gap: 11,
              tabs:const [
                GButton(icon: Icons.home_outlined,
                    text: "Home"
                ),

                GButton(icon: Icons.add_business_outlined,
                  text: "Add ",
                ),

                GButton(
                  icon: Icons.bar_chart_outlined,
                  text: "Stats",
                ),

                GButton(icon: Icons.person_pin_outlined,
                  text: "Send",
                ),

              ]
          ),
        ),
      )

    );
  }
}
