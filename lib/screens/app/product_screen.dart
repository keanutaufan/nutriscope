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
                    : Text(name),
          ],
        ),
      ),
    );
  }
}
