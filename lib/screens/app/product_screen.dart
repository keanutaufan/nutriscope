import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:nutriscope/components/static_ingredient_list_item.dart';
import 'package:nutriscope/components/ns_ghost_button.dart';
import 'package:nutriscope/screens/app/ingredient_detail_screen.dart';

class ProductScreen extends StatefulWidget {
  final String? qrPayload;

  const ProductScreen({super.key, required this.qrPayload});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  static final db = FirebaseFirestore.instance;
  static final storage = FirebaseStorage.instance;
  static final auth = FirebaseAuth.instance;

  bool exist = true;
  bool loading = true;
  bool safe = true;

  String name = "";
  String description = "";
  List<dynamic> ingredients = [];
  String imageUrl = "";
  List markedIngredients = [];

  Future<void> _asyncInitState() async {
    final currentUser = auth.currentUser;
    if (currentUser != null) {
      final doc =
          await db.collection("userPreferences").doc(currentUser.uid).get();
      final data = doc.data() as Map<String, dynamic>;
      markedIngredients = List.from(data["markedIngredients"]);
    }

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
        final status = markedIngredients.contains(ingredientDoc.id) ? 1 : 0;

        if (status == 1) {
          safe = false;
        }

        return {
          "id": ingredientDoc.id,
          "name": ingredientDoc.data()!["name"],
          "status": status,
        };
      }).toList();

      imageUrl = await storage.ref().child(data["image"]).getDownloadURL();
    } else {
      exist = false;
    }

    loading = false;
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _asyncInitState().whenComplete(() => setState(() {}));
    }
  }

  void _onRequestInfo(String text, String id) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            IngredientDetailScreen(name: text, id: id),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
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
                                    return StaticIngredientListItem(
                                      id: ingredients[index]["id"],
                                      label: ingredients[index]["name"],
                                      status: ingredients[index]["status"],
                                      onTapInfo: () => _onRequestInfo(
                                        ingredients[index]["name"],
                                        ingredients[index]["id"],
                                      ),
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
