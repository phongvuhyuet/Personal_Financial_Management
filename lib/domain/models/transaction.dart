import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  String? id;
  bool? is_output;
  int amount;

  var userRef;
  var categoryRef;
  Timestamp createdAt;

  Transaction({
    this.id,
    this.is_output,
    required this.amount,
    required this.userRef,
    required this.categoryRef,
    required this.createdAt,
  });
  factory Transaction.fromSnapshot(DocumentSnapshot snapshot) {
    final transaction =
        Transaction.fromJson(snapshot.data() as Map<String, dynamic>);
    transaction.id = snapshot.reference.id;
    return transaction;
  }
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["documentID"],
      is_output: json["is_output"],
      amount: json["amount"],
      userRef: json["userRef"],
      categoryRef: json["categoryRef"],
      createdAt: json["created_at"],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "is_output": is_output,
        "amount": amount,
        "userRef": userRef,
        "categoryRef": categoryRef,
        "created_at": createdAt,
      };
  @override
  List<Object?> get props => [
        id,
        is_output,
        amount,
        userRef,
        categoryRef,
        createdAt,
      ];
}
