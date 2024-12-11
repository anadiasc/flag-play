import 'package:flag_play/screens/home/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: StartScreen(),
      ),
    );
  }
}
