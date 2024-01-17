import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:nutriscope/components/ingredient_list_item.dart';
import 'package:nutriscope/components/ns_ghost_button.dart';

class ProductScreen extends StatefulWidget {
  final String? qrPayload;

  const ProductScreen({super.key, required this.qrPayload});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  static final db = FirebaseFirestore.instance;
  static final storage = FirebaseStorage.instance;

  bool exist = true;
  bool loading = true;
  String name = "";
  String description = "";
  List<dynamic> ingredients = [];
  String imageUrl = "";

  Future<void> _asyncInitState() async {
    final doc = await db.collection("products").doc(widget.qrPayload).get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      name = data["name"];
      description = data["description"];

      final ingredientIDs = List<String>.from(data["ingredients"]);
      final ingredientFutures = ingredientIDs
          .map((id) => db.collection("ingredientLabels").doc(id).get());
      final ingredientDocs = await Future.wait(ingredientFutures);

      ingredients = ingredientDocs.map((ingredientDoc) {
        return {"id": ingredientDoc.id, "name": ingredientDoc.data()!["name"]};
      }).toList();

      imageUrl = await storage.ref().child(data["image"]).getDownloadURL();
    } else {
      exist = false;
    }

    print(ingredients);

    loading = false;
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _asyncInitState().whenComplete(() => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              width: 72,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 72, vertical: 16),
                  child: Image.asset("assets/images/nutriscope-logo-text.png"),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ListView(
                padding: const EdgeInsets.all(32),
                children: [
                  loading
                      ? const Center(child: Text("Loading..."))
                      : !exist
                          ? const Center(
                              child: Text("Barang Tidak Ditemukan!"),
                            )
                          : Column(
                              children: [
                                const Text(
                                  "Produk Terpindai!",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                // Image
                                SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.network(
                                    imageUrl,
                                  ),
                                ),

                                // Product Name
                                Text(
                                  name,
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: 32),

                                const Text(
                                  "Tentang Produk Ini:",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: 8),

                                // Description
                                Text(
                                  description,
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),

                                const SizedBox(height: 32),

                                const Text(
                                  "Kandungan Produk:",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: 16),

                                // Ingredients
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: ingredients.length,
                                  itemBuilder: (context, index) {
                                    return IngredientListItem(
                                      id: ingredients[index]["id"],
                                      label: ingredients[index]["name"],
                                      status: 0,
                                      onTapInfo: null,
                                    );
                                  },
                                ),
                              ],
                            ),
                  const SizedBox(height: 28),
                  NSGhostButton(
                    text: "Kembali ke Pemindai",
                    onPressed: () => Navigator.of(context).pop(),
                    foregroundColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
