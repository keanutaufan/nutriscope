import 'package:cloud_firestore/cloud_firestore.dart';

class IngredientLabel {
  final String id;
  final String? name;

  IngredientLabel({
    required this.id,
    this.name,
  });

  factory IngredientLabel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return IngredientLabel(
      id: snapshot.id,
      name: data?["name"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      if (name != null) "name": name,
    };
  }
}
