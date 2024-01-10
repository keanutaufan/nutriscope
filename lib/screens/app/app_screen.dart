import 'package:flutter/material.dart';
import 'package:nutriscope/screens/app/scanner_screen.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScannerScreen(),
    );
  }
}
