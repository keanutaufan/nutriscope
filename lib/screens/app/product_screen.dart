import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String? qrPayload;

  const ProductScreen({super.key, required this.qrPayload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("QR Data: ${qrPayload ?? qrPayload}"),
        ),
      ),
    );
  }
}
