import 'package:flutter/material.dart';
import 'package:learn_api/api_display_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        fontFamily: 'Roboto',
      ),
      home: ApiDisplayScreen(),

    );
  }
}

