import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_starter/screens/home_screen.dart';
import 'package:todo_starter/screens/signup_screen.dart';
import 'package:todo_starter/view_model/view_model.dart';
import 'package:todo_starter/widgets/custom_textfield.dart';


final vm = ViewModel();

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: FirebaseAuth.instance.currentUser != null ? HomeScreen() : SignupScreen()
      home: SignupScreen(),
    );
  }
}
