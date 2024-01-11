import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String name;
  final String email;
  final DateTime createdAt;

  const AccountCard({
    super.key,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  static const List monthNames = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),

          const SizedBox(height: 6),

          // Email
          Text(
            email,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: "Montserrat",
            ),
          ),

          const SizedBox(height: 24),

          // Registration date
          Text(
            "Terdaftar sejak ${createdAt.day} ${monthNames.elementAt(createdAt.month - 1)} ${createdAt.year}",
            style: const TextStyle(
              color: Color.fromRGBO(194, 194, 194, 1),
              fontSize: 14,
              fontFamily: "Montserrat",
            ),
          ),
        ],
      ),
    );
  }
}
