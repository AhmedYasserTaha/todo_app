import 'package:flutter/material.dart';
import 'package:todo_app/home/empty_screen.dart';
import 'package:todo_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmptyScreen(),
    );
  }
}
