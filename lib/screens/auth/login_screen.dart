import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutriscope/components/input_field.dart';
import 'package:nutriscope/components/ns_fill_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoggingIn = false;

  void signIn() async {
    try {
      setState(() {
        isLoggingIn = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) {
        // Go back to redirect screen, which will redirect us to app
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (_) {
      setState(() {
        isLoggingIn = false;
      });

      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Error: Wrong email or password"),
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Email
        InputField(
          placeholder: "Email",
          icon: Icons.email,
          controller: emailController,
        ),

        const SizedBox(height: 16),

        // Password
        InputField(
          placeholder: "Password",
          icon: Icons.password,
          obscureText: true,
          controller: passwordController,
        ),

        const SizedBox(height: 32),

        // Login Button
        isLoggingIn
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(255, 215, 0, 1),
                ),
              )
            : NSFillButton(
                text: "Masuk",
                onPressed: signIn,
                backgroundColor: const Color.fromRGBO(255, 215, 0, 1),
                foregroundColor: Colors.white,
              ),
      ],
    );
  }
}
