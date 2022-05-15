import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String? email;
  final String password;
  final String phone;
  final String? address;
  final String? avatar;
  final String role;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final String status;
  final String token;
  const User({
    required this.id,
    required this.name,
    this.email,
    required this.password,
    required this.phone,
    this.address,
    this.avatar,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.status,
    required this.token,
  });
  // empty constructor
  static const empty = User(
    id: '',
    name: '',
    email: '',
    password: '',
    phone: '',
    address: '',
    avatar: '',
    role: '',
    createdAt: '',
    updatedAt: '',
    deletedAt: '',
    status: '',
    token: '',
  );
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        address: json["address"],
        avatar: json["avatar"],
        role: json["role"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        status: json["status"],
        token: json["token"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "address": address,
        "avatar": avatar,
        "role": role,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "status": status,
        "token": token,
      };
  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        phone,
        address,
        avatar,
        role,
        createdAt,
        updatedAt,
        deletedAt,
        status,
        token,
      ];
}
