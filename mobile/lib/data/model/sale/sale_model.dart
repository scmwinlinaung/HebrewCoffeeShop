import 'package:equatable/equatable.dart';

class SaleModel extends Equatable {
  final String id;
  final String menuClassification;
  final double price;
  final String menu;
  final double amount;

  const SaleModel(
      {required this.id,
      required this.menuClassification,
      required this.price,
      required this.menu,
      required this.amount});

  factory SaleModel.fromJson(Map<String, dynamic> data) {
    return SaleModel(
        id: data['_id'],
        menuClassification: data['menuClassification'],
        price: data['price'],
        menu: data['menu'],
        amount: data['amount']);
  }

  factory SaleModel.fromMap(Map<String, dynamic> json) {
    return SaleModel(
        id: json['_id'],
        menuClassification: json['menuClassification'],
        price: json['price'],
        menu: json['menu'],
        amount: json['amount']);
  }

  @override
  List<Object?> get props => [id, menuClassification, price, menu, amount];
}
