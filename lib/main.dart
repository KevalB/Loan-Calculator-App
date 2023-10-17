import 'package:flutter/material.dart';
import 'package:practical_4/screens/calc_screen.dart';
import 'package:practical_4/screens/main_screen.dart';
import 'package:practical_4/screens/res_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: CalculatorScreen());
  }
}
