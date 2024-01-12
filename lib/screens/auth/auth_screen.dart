import 'package:flutter/material.dart';
import 'package:nutriscope/components/two_switcher.dart';
import 'package:nutriscope/screens/auth/login_screen.dart';
import 'package:nutriscope/screens/auth/register_screen.dart';

class AuthScreen extends StatefulWidget {
  final int initialIndex;

  const AuthScreen({super.key, required this.initialIndex});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _activeIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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

                  const SizedBox(height: 48),

                  // Switcher
                  TwoSwitcher(
                    firstLabel: "Daftar",
                    secondLabel: "Masuk",
                    activeIndex: _activeIndex,
                    onFirstPressed: () {
                      setState(() {
                        _activeIndex = 0;
                      });
                    },
                    onSecondPressed: () {
                      setState(() {
                        _activeIndex = 1;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 64),

              // The Login/Register View
              _activeIndex == 0 ? const RegisterScreen() : const LoginScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
