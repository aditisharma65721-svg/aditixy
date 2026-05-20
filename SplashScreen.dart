import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 8), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          // 🖼️ Background Image
          Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.cover,
          ),

          // 🔲 Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          // 🍔 Center Content
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ],
          ),
        ],
      ),
    );
  }
}
