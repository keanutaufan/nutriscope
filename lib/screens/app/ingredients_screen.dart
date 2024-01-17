import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutriscope/components/ingredient_list_item.dart';
import 'package:nutriscope/screens/app/ingredient_detail_screen.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  static final db = FirebaseFirestore.instance;

  final List labels = [];
  List markedIngredients = [];

  Future<void> _initState() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final doc =
          await db.collection("userPreferences").doc(currentUser.uid).get();
      final data = doc.data() as Map<String, dynamic>;
      markedIngredients = List.from(data["markedIngredients"]);
    }

    final doc = await db.collection("ingredientLabels").get();
    for (var docSnapshot in doc.docs) {
      labels.add([
        {
          "id": docSnapshot.id,
          "name": docSnapshot.data()["name"],
        },
        markedIngredients.contains(docSnapshot.id) ? 1 : 0,
      ]);
    }
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _initState().whenComplete(() => setState(() {}));
    }
  }

  void _setStatus(int index, int status) async {
    if (labels[index][1] == status) {
      return;
    }

    labels[index][1] = status;

    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Restrict -> OK
      if (status == 0) {
        await db.collection("userPreferences").doc(currentUser.uid).update({
          "markedIngredients": FieldValue.arrayRemove([labels[index][0]["id"]])
        });
      }

      // OK -> Restrict
      else if (status == 1) {
        await db.collection("userPreferences").doc(currentUser.uid).update({
          "markedIngredients": FieldValue.arrayUnion([labels[index][0]["id"]])
        });
      }
    }

    setState(() {});
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
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              itemCount: labels.length,
              itemBuilder: (context, index) {
                return IngredientListItem(
                  label: labels[index][0]["name"],
                  id: labels[index][0]["id"],
                  status: labels[index][1],
                  onTapInfo: () => _onRequestInfo(
                    labels[index][0]["name"],
                    labels[index][0]["id"],
                  ),
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
