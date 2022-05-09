import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  String id;
  String name;
  String type;
  BigInt amount;
  String createdAt;
  String updatedAt;
  String deletedAt;
  Wallet({
    required this.id,
    required this.name,
    required this.type,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        amount: json["amount"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "amount": amount,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
  @override
  List<Object?> get props => [
        id,
        name,
        type,
        amount,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
