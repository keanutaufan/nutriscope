import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutriscope/components/account_card.dart';
import 'package:nutriscope/components/ns_fill_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          // Heading
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Akun Anda",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          // Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AccountCard(
              name: "John Smith",
              email: "johnsmith@nutriscope.com",
              createdAt: DateTime.parse("2024-01-11 00:00:07Z"),
            ),
          ),

          NSFillButton(
            text: "Logout",
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
