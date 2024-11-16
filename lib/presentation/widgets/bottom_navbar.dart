import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:userapp/presentation/screens/home/home_view/home_view.dart';
// import 'package:userapp/presentation/screens/home/user_create/user_create.dart';
// import 'package:userapp/presentation/screens/home/user_info/user_info.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    // HomeView(),
    // UserCreate(),
    // UserInfo(),
    
  ];

  void goToPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
            child: GNav(
            gap: 5, 
            activeColor: Colors.white, 
            iconSize: 20, 
            textStyle: TextStyle(fontSize: 12),
            duration: Duration(milliseconds: 200), 
            tabBackgroundColor: Colors.purple[300]!, 
            backgroundColor: Colors.purple[400]!,
            color: Colors.white, 
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30), 
        onTabChange: (index) => goToPage(index),
        tabs: [
          GButton(
            
            icon: Icons.home,
            text: 'Home',
            
          ),
          GButton(
            icon: Icons.supervised_user_circle_outlined,
            text: 'Create',
          ),
          GButton(
            icon: Icons.text_fields,
            text: 'Info',
            
          ),
          
        ],
        
      ),
        )));
  }
}
