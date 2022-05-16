import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  String id;
  String name;
  bool? isOutput;

  Category({
    required this.id,
    required this.name,
    this.isOutput,
  });
  factory Category.fromSnapshot(DocumentSnapshot snapshot) {
    final transaction =
        Category.fromJson(snapshot.data() as Map<String, dynamic>);
    transaction.id = snapshot.reference.id;
    return transaction;
  }
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        isOutput: json["is_output"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isOutput": isOutput,
      };
  @override
  List<Object?> get props => [
        id,
        name,
        isOutput,
      ];
}
