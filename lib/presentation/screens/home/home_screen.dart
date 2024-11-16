import 'package:flutter/material.dart';
import 'package:userapp/presentation/screens/home/home_view/home_view.dart';
import 'package:userapp/presentation/screens/home/user_create/user_create.dart';
import 'package:userapp/presentation/screens/home/user_info/user_info.dart';
import 'package:userapp/presentation/widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  final int viewIndex;
  const HomeScreen({super.key, required this.viewIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: viewIndex, children: const [
        HomeView(),
        UserCreate(),
        UserInfo()
      ],),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}