import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String? qrPayload;

  const ProductScreen({super.key, required this.qrPayload});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  static final db = FirebaseFirestore.instance;

  bool exist = true;
  bool loading = true;
  String name = "";
  String description = "";

  @override
  void initState() {
    super.initState();
    db
        .collection("products")
        .doc(widget.qrPayload)
        .get()
        .then((DocumentSnapshot doc) {
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        name = data["name"];
        description = data["description"];
      } else {
        exist = false;
      }
      loading = false;
      setState(() {});
    });
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
            loading
                ? const Center(child: Text("Loading..."))
                : !exist
                    ? const Center(
                        child: Text("Barang Tidak Ditemukan!"),
                      )
                    : Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            // Heading
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
                                "https://placehold.co/120x100/png",
                                // width: 120,
                                // height: 100,
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
                            )
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
