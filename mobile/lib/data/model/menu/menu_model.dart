import 'package:equatable/equatable.dart';

enum MenuStatus { active, inactive }

class MenuModel extends Equatable {
  final String id;
  final String name;
  final String classification;
  final String orderType;
  final double price;
  final String imageBase64;
  final String imageType;
  final MenuStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const MenuModel(
      {required this.id,
      required this.name,
      required this.classification,
      required this.orderType,
      required this.price,
      required this.imageBase64,
      required this.imageType,
      required this.status,
      required this.createdAt,
      required this.updatedAt});
  factory MenuModel.fromJson(Map<String, dynamic> data) {
    return MenuModel(
        id: data['_id'],
        name: data['name'],
        classification: data['classification'],
        orderType: data['orderType'],
        price: double.parse(data['price'].toString()),
        imageBase64: data['imageBase64'],
        imageType: data['imageType'],
        status: data['status'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt']);
  }

  factory MenuModel.fromMap(Map<String, dynamic> json) {
    return MenuModel(
        id: json['_id'],
        name: json['name'],
        classification: json['classification'],
        orderType: json['orderType'],
        price: json['price'],
        imageBase64: json['imageBase64'],
        imageType: json['imageType'],
        status: json['status'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  factory MenuModel.Empty() {
    return MenuModel(
        id: '',
        name: '',
        classification: '',
        orderType: '',
        price: 0,
        imageBase64: '',
        imageType: '',
        status: MenuStatus.active,
        createdAt: DateTime(2022, 9, 7, 17, 30),
        updatedAt: DateTime(2022, 9, 7, 17, 30));
  }
  @override
  List<Object> get props => [
        id,
        name,
        classification,
        orderType,
        price,
        imageBase64,
        imageType,
        createdAt,
        updatedAt
      ];
}
