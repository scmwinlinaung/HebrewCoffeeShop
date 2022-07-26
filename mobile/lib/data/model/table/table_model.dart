import 'package:equatable/equatable.dart';

class TableModel extends Equatable {
  final String id;
  final String name;
  final List<String> menus;
  final double total;
  final String status;
  final String approvedBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TableModel(
      {required this.id,
      required this.name,
      required this.menus,
      required this.total,
      required this.status,
      required this.approvedBy,
      required this.createdAt,
      required this.updatedAt});

  factory TableModel.fromJson(Map<String, dynamic> data) {
    return TableModel(
      id: data['_id'],
      name: data['name'],
      menus: List<String>.from(data['menus']),
      total: double.parse(data['total'].toString()),
      status: data['status'],
      approvedBy: data['approvedBy'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }

  factory TableModel.fromMap(Map<String, dynamic> json) {
    return TableModel(
      id: json['id'],
      name: json['name'],
      menus: List<String>.from(json['menus']),
      total: json['total'],
      status: json['status'],
      approvedBy: json['approvedBy'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  factory TableModel.empty() {
    return TableModel(
        id: '',
        name: '',
        menus: [],
        total: 0,
        status: '',
        approvedBy: '',
        createdAt: DateTime(2022, 9, 7, 17, 30),
        updatedAt: DateTime(2022, 9, 7, 17, 30));
  }

  @override
  List<Object?> get props =>
      [id, name, menus, total, status, approvedBy, createdAt, updatedAt];
}
