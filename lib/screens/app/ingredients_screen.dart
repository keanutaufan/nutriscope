import 'package:flutter/material.dart';
import 'package:nutriscope/components/ingredient_list_item.dart';

class IngredientsScreen extends StatelessWidget {
  const IngredientsScreen({super.key});

  static const List<String> placeholder = [
    "Tepung Terigu",
    "Tepung Jagung",
    "Tepung Ketan",
    "Tepung Beras",
    "Daging Ikan",
    "Daging Ayam",
    "Daging Sapi",
    "Daging Babi",
    "Daging Domba",
    "Daging Kambing",
    "Daging Kerbau",
    "Minyak Nabati",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Heading
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Atur Profil Makanan",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          // List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: placeholder.length,
              itemBuilder: (context, index) {
                return IngredientListItem(
                  label: placeholder.elementAt(index),
                  status: 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
