import 'package:equatable/equatable.dart';

class MenuModel extends Equatable {
  final String id;
  final String name;
  final String classification;
  final String orderType;
  final double price;
  final String imageBase64;
  final String imageType;

  const MenuModel(
      {required this.id,
      required this.name,
      required this.classification,
      required this.orderType,
      required this.price,
      required this.imageBase64,
      required this.imageType});
  factory MenuModel.fromJson(Map<String, dynamic> data) {
    return MenuModel(
        id: data['_id'],
        name: data['name'],
        classification: data['classification'],
        orderType: data['orderType'],
        price: double.parse(data['price'].toString()),
        imageBase64: data['imageBase64'],
        imageType: data['imageType']);
  }

  factory MenuModel.fromMap(Map<String, dynamic> json) {
    return MenuModel(
        id: json['_id'],
        name: json['name'],
        classification: json['classification'],
        orderType: json['orderType'],
        price: json['price'],
        imageBase64: json['imageBase64'],
        imageType: json['imageType']);
  }

  factory MenuModel.Empty() {
    return const MenuModel(
        id: '',
        name: '',
        classification: '',
        orderType: '',
        price: 0,
        imageBase64: '',
        imageType: '');
  }
  @override
  List<Object> get props =>
      [id, name, classification, orderType, price, imageBase64, imageType];
}
