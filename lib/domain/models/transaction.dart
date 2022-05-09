import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  String id;
  Bool? isInput;
  Double amount;
  String createdAt;
  String updatedAt;
  String deletedAt;
  Transaction({
    required this.id,
    this.isInput,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        isInput: json["isInput"],
        amount: json["amount"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "isInput": isInput,
        "amount": amount,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
  @override
  List<Object?> get props => [
        id,
        isInput,
        amount,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
