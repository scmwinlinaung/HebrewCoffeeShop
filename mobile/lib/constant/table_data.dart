import 'package:flutter/material.dart';
import 'package:mobile/data/model/table/table_model.dart';

List<TableModel> tables = [
  TableModel(
      id: '',
      name: 'Table 1',
      menus: ['Rice', 'Juice'],
      amount: 1100,
      status: 'InAcitive',
      approvedBy: 'Admin'),
  TableModel(
      id: '',
      name: 'Table 2',
      menus: ['Rice', 'Juice'],
      amount: 1100,
      status: 'InAcitive',
      approvedBy: 'Admin'),
  TableModel(
      id: '',
      name: 'Table 3',
      menus: ['Chicken', 'Water'],
      amount: 2200,
      status: 'InAcitive',
      approvedBy: 'Admin'),
  TableModel(
      id: '',
      name: 'Table 4',
      menus: ['Pork', 'Juice'],
      amount: 4000,
      status: 'InAcitive',
      approvedBy: 'Admin'),
  TableModel(
      id: '',
      name: 'Table 5',
      menus: ['Palata', 'Juice'],
      amount: 3000,
      status: 'InAcitive',
      approvedBy: 'Admin'),
  TableModel(
      id: '',
      name: 'Table 6',
      menus: ['Palata', 'Juice'],
      amount: 3000,
      status: 'InAcitive',
      approvedBy: 'Admin'),
  TableModel(
      id: '',
      name: 'Table 7',
      menus: ['Palata', 'Juice'],
      amount: 3000,
      status: 'InAcitive',
      approvedBy: 'Admin'),
  TableModel(
      id: '',
      name: 'Table 8',
      menus: ['Palata', 'Juice'],
      amount: 3000,
      status: 'InAcitive',
      approvedBy: 'Admin'),
  TableModel(
      id: '',
      name: 'Table 9',
      menus: ['Palata', 'Juice'],
      amount: 3000,
      status: 'InAcitive',
      approvedBy: 'Admin'),
];

List<Map<String, dynamic>> tableFormData = [
  {"icon": Icons.table_restaurant, "title": "name"},
  {"icon": Icons.menu_book, "title": "menus"},
  {"icon": Icons.monetization_on, "title": "amount"},
];
