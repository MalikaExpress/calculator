import 'package:calculator/calculator.dart';
import 'package:calculator/image_wid.dart';
import 'package:calculator/kalkulator.dart';
import 'package:calculator/scaffold_wid.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 47, 154, 164)),
        useMaterial3: true,
      ),
      home: ImageWid(),
    );
  }
}
