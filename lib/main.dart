import 'package:flutter/material.dart';
import 'package:kalkulator/home.dart';
void main() { 
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}