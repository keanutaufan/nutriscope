import 'package:flutter/material.dart';
import 'package:nutriscope/screens/auth/login_offer_screen.dart';

void main() {
  runApp(const NutriScopeApp());
}

class NutriScopeApp extends StatelessWidget {
  const NutriScopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOfferScreen(),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(27, 68, 49, 1),
      ),
    );
  }
}
