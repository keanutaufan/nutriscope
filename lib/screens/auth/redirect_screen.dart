import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutriscope/screens/app/app_screen.dart';
import 'package:nutriscope/screens/auth/login_offer_screen.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const AppScreen();
          } else {
            return const LoginOfferScreen();
          }
        }),
      ),
    );
  }
}
