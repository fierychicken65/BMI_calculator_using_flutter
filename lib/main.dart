import 'package:flutter/material.dart';
import 'package:bmi_calculator/inputpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
              color: Colors.deepPurple, foregroundColor: Colors.black87),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.black87)),
      home: const InputPage(),
    );
  }
}

