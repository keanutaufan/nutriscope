import 'package:flutter/material.dart';

class IngredientDetailScreen extends StatelessWidget {
  final String name;

  const IngredientDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(name),
      ),
    );
  }
}
