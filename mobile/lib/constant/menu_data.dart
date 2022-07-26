import 'package:mobile/data/model/menu/menu_model.dart';

List<MenuModel> menus = [
  MenuModel(
      id: '1',
      name: 'Latte',
      classification: 'Coffee',
      price: 2000,
      imageBase64: '',
      imageType: '',
      status: MenuStatus.active,
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
  MenuModel(
      id: '2',
      name: 'Cappachino',
      classification: 'Coffee',
      price: 3000,
      imageBase64: '',
      imageType: '',
      status: MenuStatus.active,
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
  MenuModel(
      id: '3',
      name: 'Sandwich',
      classification: 'Snack',
      price: 2500,
      imageBase64: '',
      imageType: '',
      status: MenuStatus.active,
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
];
