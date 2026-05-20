import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'SplashScreen.dart';

void main() {
  runApp(FoodApp());
}
class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swish App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
