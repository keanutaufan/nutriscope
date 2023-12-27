import 'package:flutter/material.dart';
import 'package:nutriscope/components/input_field.dart';
import 'package:nutriscope/components/ns_fill_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Email
        const InputField(
          placeholder: "Email",
          icon: Icons.email,
          obscureText: false,
        ),

        const SizedBox(height: 16),

        const InputField(
          placeholder: "Password",
          icon: Icons.password,
          obscureText: true,
        ),

        const SizedBox(height: 16),

        const InputField(
          placeholder: "Konfirmasi Password",
          icon: Icons.password,
          obscureText: true,
        ),

        const SizedBox(height: 32),

        // Login Button
        NSFillButton(
          text: "Daftar",
          onPressed: () {},
          backgroundColor: const Color.fromRGBO(255, 215, 0, 1),
          foregroundColor: Colors.white,
        ),
      ],
    );
  }
}
