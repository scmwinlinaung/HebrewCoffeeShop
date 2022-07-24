import 'package:equatable/equatable.dart';

class ExpenseModel extends Equatable {
  final String id;
  final String title;
  final String category;
  final int amount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ExpenseModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.amount,
      required this.createdAt,
      required this.updatedAt});

  factory ExpenseModel.fromJson(Map<String, dynamic> data) {
    return ExpenseModel(
        id: data['_id'],
        title: data['title'],
        category: data['category'],
        amount: data['amount'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt']);
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> json) {
    return ExpenseModel(
        id: json['_id'],
        title: json['title'],
        category: json['category'],
        amount: json['amount'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  factory ExpenseModel.Empty() {
    return ExpenseModel(
        id: '',
        title: '',
        category: '',
        amount: 0,
        createdAt: DateTime(2022, 9, 7, 17, 30),
        updatedAt: DateTime(2022, 9, 7, 17, 30));
  }
  @override
  List<Object> get props => [id, title, category, amount, createdAt, updatedAt];
}
