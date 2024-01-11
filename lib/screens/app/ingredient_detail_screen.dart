import 'package:flutter/material.dart';

class IngredientDetailScreen extends StatelessWidget {
  final String name;

  const IngredientDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
              top: 38.0, 
              right: 15.0, 
              left: 15.0
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Header
            const Center(
              child: Text(
                "Informasi Bahan Makanan",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                ),
              ),
            ),
        
            Center(
              child: Text(
                name,
                style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
        
            // Padding
            const SizedBox(height: 39.0),

            const Text(
              "Label:",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                  ),
            ),
            
            // Padding
            const SizedBox(height: 8.0),

            // Horizontal ListView
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    margin: const EdgeInsets.only(right: 9.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFF1B4431)),
                    child: const Text(
                      "label 1",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    margin: const EdgeInsets.only(right: 9.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFF1B4431)),
                    child: const Text(
                      "label 2",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    margin: const EdgeInsets.only(right: 9.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFF1B4431)),
                    child: const Text(
                      "label 3",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            
            // Padding
            const SizedBox(height: 20.0),

            const Text(
              "Kategori:",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                  ),
            ),
            
            const Text(
              "kategori disini",
              style: TextStyle(
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
                  fontWeight: FontWeight.bold
                  ),
            ),
            
            const Text(
              "deskripsi disini",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  ),
            ),
        
          ],
        ),
      ),
    );
  }
}
