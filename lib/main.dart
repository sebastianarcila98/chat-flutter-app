// ignore_for_file: prefer_const_constructors
import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Application UI',
      theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.red,
              onPrimary: Colors.white,
              secondary: Color(0xffffef9eb),
              onSecondary: Colors.black,
              error: Colors.transparent,
              onError: Colors.red,
              background: Colors.white,
              onBackground: Colors.black,
              surface: Colors.white,
              onSurface: Colors.black)),
      home: HomeScreen(),
    );
  }
}
