import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String role;
  final String password;
  final String kdf;
  final String salt;
  final String address;
  final String status;
  final String tokens;

  const UserModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.role,
      required this.password,
      required this.kdf,
      required this.salt,
      required this.address,
      required this.status,
      required this.tokens});

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
        id: data['_id'],
        name: data['name'],
        phone: data['phone'],
        email: data['email'],
        role: data['role'],
        password: data['password'],
        kdf: data['kdf'],
        salt: data['salt'],
        address: data['address'],
        status: data['status'],
        tokens: data['tokens']);
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
        id: json['_id'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        role: json['role'],
        password: json['password'],
        kdf: json['kdf'],
        salt: json['salt'],
        address: json['address'],
        status: json['status'],
        tokens: json['tokens']);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        email,
        role,
        password,
        kdf,
        salt,
        address,
        status,
        tokens
      ];
}
