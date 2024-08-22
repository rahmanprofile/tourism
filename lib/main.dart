import 'package:flutter/material.dart';
import 'package:tourism/View/bottomNavigationBar.dart';
import 'package:tourism/View/io.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: IO(),
    );
  }
}
