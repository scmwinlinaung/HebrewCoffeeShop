// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:mobile/data/model/menu/menu_model.dart';
import 'package:mobile/data/model/table/table_model.dart';
import 'package:mobile/data/repository/menu/menu_repository.dart';
import 'package:mobile/data/repository/table/table_repository.dart';

// ThemeProvider: Provider Class
class TableProvider with ChangeNotifier {
  final String host;
  final String port;
  late TableRepository tableRepository;
  late MenuRepository menuRepository;

  List<TableModel> _tables = List.empty();
  List<MenuModel> _menus = List.empty();
  TableModel _table = TableModel.empty();

// getters

  List<TableModel> getTables() {
    return _tables;
  }

  List<MenuModel> getMenus() {
    return _menus;
  }

  TableModel getSelectedTable() {
    return _table;
  }

  void setSelectedTable(TableModel newTable) {
    _table = newTable;
  }

  TableProvider({required this.host, required this.port}) {
    tableRepository = TableRepository(host: host, port: port);
    menuRepository = MenuRepository(host: host, port: port);
    findAllTables();
  }

  Future<void> findAllTables() async {
    _tables = await tableRepository.findAllTables();
    notifyListeners();
  }

  Future<void> findATable(String id) async {
    _table = await tableRepository.findATable(id);
    notifyListeners();
  }

  Future<void> findAllMenus() async {
    var menus = await menuRepository.findAllMenus();
    _menus = menus
        .map((value) => MenuModel(
            id: value.id,
            name: value.name,
            classification: value.classification,
            price: value.price,
            imageBase64: value.imageBase64,
            imageType: value.imageType,
            status: value.status,
            createdAt: value.createdAt,
            updatedAt: value.updatedAt))
        .toList();
    notifyListeners();
  }

  void removeTable(String id) {
    _tables.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void addTable(TableModel newTable) {
    _tables.add(newTable);
    notifyListeners();
  }

// remove menu from selected table
  void removeMenu(int menuIndex) {
    _table.menus.removeAt(menuIndex);
    notifyListeners();
  }

// add menu to selected table
  void addMenu(String menuId) {
    _table.menus.add(menuId);
    notifyListeners();
  }

  Future<void> updateATable(TableModel tableModel) async {
    await tableRepository.updateATable(tableModel);
    notifyListeners();
  }

  void updateAmount(double amount) {
    _table = TableModel(
        id: _table.id,
        name: _table.name,
        menus: _table.menus,
        amount: amount,
        status: _table.status,
        approvedBy: _table.approvedBy,
        createdAt: _table.createdAt,
        updatedAt: _table.updatedAt);
    notifyListeners();
  }

  void updateMenu(MenuModel oldMenu, MenuModel newMenu, int oldMenuIndex) {
    _table.menus.removeAt(oldMenuIndex);
    _table.menus.insert(oldMenuIndex, newMenu.id);

    notifyListeners();
  }
}
