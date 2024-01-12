import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:nutriscope/screens/auth/redirect_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NutriScopeApp());
}

class NutriScopeApp extends StatelessWidget {
  const NutriScopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RedirectScreen(),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(27, 68, 49, 1),
      ),
    );
  }
}
