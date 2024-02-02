import 'package:depreciation_app/depreciation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DepreciationCalculatorApp());
}

class DepreciationCalculatorApp extends StatelessWidget {
  const DepreciationCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Depreciation Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DepreciationCalculatorScreen(),
    );
  }
}
