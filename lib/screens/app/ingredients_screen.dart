import 'package:flutter/material.dart';
import 'package:nutriscope/components/ingredient_list_item.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  final List _placeholder = [
    ["Tepung Terigu", 0],
    ["Tepung Jagung", 0],
    ["Tepung Ketan", 0],
    ["Tepung Beras", 1],
    ["Daging Ikan", 1],
    ["Daging Ayam", 0],
    ["Daging Sapi", 0],
    ["Daging Babi", 0],
    ["Daging Domba", 0],
    ["Daging Kambing", 0],
    ["Daging Kerbau", 0],
    ["Minyak Nabati", 0],
  ];

  void _setStatus(int index, int status) {
    setState(() {
      _placeholder[index][1] = status;
    });
  }

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
              itemCount: _placeholder.length,
              itemBuilder: (context, index) {
                return IngredientListItem(
                  label: _placeholder.elementAt(index)[0],
                  status: _placeholder.elementAt(index)[1],
                  onTapAllow: () => _setStatus(index, 0),
                  onTapWarn: () => _setStatus(index, 1),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
