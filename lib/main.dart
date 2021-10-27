import 'package:flutter/material.dart';
import 'package:widgets/checkbox.dart';
//import 'package:widgets/campo_texto.dart';
//import 'combustivel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntradaCheckbox()
    );
  }
}
