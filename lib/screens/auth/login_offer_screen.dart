import 'package:flutter/material.dart';
import 'package:nutriscope/components/ns_fill_button.dart';
import 'package:nutriscope/components/ns_ghost_button.dart';
import 'package:nutriscope/components/ns_outline_button.dart';
import 'package:nutriscope/screens/auth/auth_screen.dart';

class LoginOfferScreen extends StatelessWidget {
  const LoginOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Column(
                children: [
                  Image.asset("assets/images/nutriscope-logo-text.png"),
                  const SizedBox(height: 16),
                  const Text(
                    "Solusi digital informasi gizi dan alergen",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Montserrat",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Register
                  NSFillButton(
                    text: "Register",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AuthScreen(initialIndex: 0),
                        ),
                      );
                    },
                    backgroundColor: const Color.fromRGBO(255, 215, 0, 1),
                    foregroundColor: Colors.white,
                  ),

                  const SizedBox(height: 16),

                  // Login
                  NSOutlineButton(
                    text: "Login",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AuthScreen(initialIndex: 1),
                        ),
                      );
                    },
                    outlineColor: const Color.fromRGBO(255, 215, 0, 1),
                    foregroundColor: Colors.white,
                  ),

                  const SizedBox(height: 16),

                  // Skip
                  NSGhostButton(
                    text: "Lewati untuk sekarang",
                    onPressed: () {},
                    foregroundColor: Colors.grey,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
