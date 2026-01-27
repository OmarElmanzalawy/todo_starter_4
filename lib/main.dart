import 'package:flutter/material.dart';
import 'package:todo_starter/screens/signup_screen.dart';
import 'package:todo_starter/widgets/custom_textfield.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    

    return MaterialApp(
      home: SignupScreen()
    );
  }
}
