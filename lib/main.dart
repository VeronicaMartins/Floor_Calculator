import 'package:floor_calculator/core/theme_app.dart';
import 'package:floor_calculator/pages/calculator_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de Pisos',
      theme: themeApp,
      home: CalculatorPage(),
    );
  }
}
