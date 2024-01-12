import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IngredientDetailScreen extends StatefulWidget {
  final String name;
  final String id;

  const IngredientDetailScreen({
    super.key,
    required this.name,
    required this.id,
  });

  @override
  State<IngredientDetailScreen> createState() => _IngredientDetailScreenState();
}

class _IngredientDetailScreenState extends State<IngredientDetailScreen> {
  static final db = FirebaseFirestore.instance;

  String description = "Loading...";
  String category = "Loading...";
  List<dynamic> labels = [];

  @override
  void initState() {
    super.initState();
    db
        .collection("ingredients")
        .doc(widget.id)
        .get()
        .then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      description = data["description"];
      category = data["category"];
      labels = List.from(data["tags"]);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 38, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  "Informasi Bahan Makanan",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Padding
            const SizedBox(height: 39.0),

            const Text(
              "Label:",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Padding
            const SizedBox(height: 8.0),

            // Horizontal ListView
            SizedBox(
              height: 28,
              // scrollDirection: Axis.horizontal,
              child: labels.isEmpty
                  ? const Text(
                      "No Label",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: labels.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 12),
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Text(
                            labels[index],
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Padding
            const SizedBox(height: 20.0),

            const Text(
              "Kategori:",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              category,
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14,
              ),
            ),

            // Padding
            const SizedBox(height: 20.0),

            const Text(
              "Deskripsi:",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                description,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
