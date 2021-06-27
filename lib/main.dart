import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toyo/presentation/screens/OnboardingPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: OnboardingPage(),
    );
  }
}
