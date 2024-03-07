import 'package:flutter/material.dart';
import 'constant.dart';
import 'home_screen.dart';
// import 'login_screen.dart';

void main() {
  runApp(const InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      // home: LoginScreen(),
      home: HomeScreen(),
    );
  }
}
