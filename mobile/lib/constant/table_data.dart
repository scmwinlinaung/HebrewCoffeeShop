import 'package:flutter/material.dart';
import 'package:mobile/data/model/table/table_model.dart';

List<TableModel> tables = [
  TableModel(
      id: '',
      name: 'Table 1',
      menus: ['Rice', 'Juice'],
      total: 1100,
      status: 'InAcitive',
      approvedBy: 'Admin',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
  TableModel(
      id: '',
      name: 'Table 2',
      menus: ['Rice', 'Juice'],
      total: 1100,
      status: 'InAcitive',
      approvedBy: 'Admin',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
  TableModel(
      id: '',
      name: 'Table 3',
      menus: ['Cappachino', 'Water'],
      total: 2200,
      status: 'InAcitive',
      approvedBy: 'Admin',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
  TableModel(
      id: '',
      name: 'Table 4',
      menus: ['Sanwich', 'Americano'],
      total: 4000,
      status: 'InAcitive',
      approvedBy: 'Admin',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
  TableModel(
      id: '',
      name: 'Table 5',
      menus: ['Pizza', 'Juice'],
      total: 3000,
      status: 'InAcitive',
      approvedBy: 'Admin',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
  TableModel(
      id: '',
      name: 'Table 6',
      menus: ['Latte', 'Juice'],
      total: 3000,
      status: 'InAcitive',
      approvedBy: 'Admin',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
  TableModel(
      id: '',
      name: 'Table 7',
      menus: ['Americano', 'Juice'],
      total: 3000,
      status: 'InAcitive',
      approvedBy: 'Admin',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
  TableModel(
      id: '',
      name: 'Table 8',
      menus: ['Coffee', 'Juice'],
      total: 3000,
      status: 'InAcitive',
      approvedBy: 'Admin',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
  TableModel(
      id: '',
      name: 'Table 9',
      menus: ['Juice', 'Tea'],
      total: 3000,
      status: 'InAcitive',
      approvedBy: 'Admin',
      createdAt: DateTime(2017, 9, 7, 17, 30),
      updatedAt: DateTime(2017, 9, 7, 17, 30)),
];

List<Map<String, dynamic>> tableFormData = [
  {"icon": Icons.table_restaurant, "title": "name"},
  {"icon": Icons.menu_book, "title": "menus"},
  {"icon": Icons.monetization_on, "title": "total"},
];
