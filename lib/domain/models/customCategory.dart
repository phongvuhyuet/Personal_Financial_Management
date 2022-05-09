import 'package:equatable/equatable.dart';

class Category extends Equatable {
  String id;
  String name;
  bool? isInput;
  String createdAt;
  String updatedAt;
  String deletedAt;
  Category({
    required this.id,
    required this.name,
    this.isInput,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        isInput: json["isInput"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isInput": isInput,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
  @override
  List<Object?> get props => [
        id,
        name,
        isInput,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
