import 'package:flutter/material.dart';
import 'package:toonflix/Screens/home_screen.dart';
import 'package:toonflix/Screens/login_screen.dart';
import 'package:toonflix/Screens/register_screen.dart';

void main() {
  runApp(const MyApp()); // MyApp()은 앱의 시작점
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
