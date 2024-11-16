import 'package:flutter/material.dart';
import 'package:userapp/presentation/screens/home/home_view/home_view.dart';
import 'package:userapp/presentation/screens/home/user_create/user_create.dart';
import 'package:userapp/presentation/screens/home/user_info/user_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/CreateUser': (context) => const UserCreate(),
        '/Perfil': (context) => const UserInfo(),
      },  
    );
  }
}


