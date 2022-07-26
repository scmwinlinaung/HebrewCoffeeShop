import 'package:equatable/equatable.dart';

class SaleModel extends Equatable {
  final String id;
  final String menuClassification;
  final double price;
  final String menu;
  final double amount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SaleModel(
      {required this.id,
      required this.menuClassification,
      required this.price,
      required this.menu,
      required this.amount,
      required this.createdAt,
      required this.updatedAt});

  factory SaleModel.fromJson(Map<String, dynamic> data) {
    return SaleModel(
        id: data['_id'],
        menuClassification: data['menuClassification'],
        price: data['price'],
        menu: data['menu'],
        amount: data['amount'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt']);
  }

  factory SaleModel.fromMap(Map<String, dynamic> json) {
    return SaleModel(
        id: json['_id'],
        menuClassification: json['menuClassification'],
        price: json['price'],
        menu: json['menu'],
        amount: json['amount'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  factory SaleModel.Empty() {
    return SaleModel(
        id: '1',
        menuClassification: 'Coffee',
        price: 2000,
        menu: 'Cappachino',
        amount: 1,
        createdAt: DateTime(2022, 9, 7, 17, 30),
        updatedAt: DateTime(2022, 9, 7, 17, 30));
  }

  @override
  List<Object?> get props =>
      [id, menuClassification, price, menu, amount, createdAt, updatedAt];
}
