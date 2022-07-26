import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/data/model/table/table_model.dart';

class TableApiProvider {
  final String host;
  final String port;
  TableApiProvider({required this.host, required this.port});
  List<TableModel> parseTables(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<TableModel>((json) => TableModel.fromJson(json)).toList();
  }

  TableModel parseTable(String responseBody) {
    final parsed = json.decode(responseBody);
    return TableModel.fromJson(parsed);
  }

  Future<List<TableModel>> findAllTables() async {
    var client = http.Client();

    final url = Uri.parse("http://" + host + ":" + port + "/api/v1/tables");

    var response = await client.get(url);
    if (response.statusCode == 200) {
      return parseTables(response.body);
    } else {
      throw Exception('Unable to fetch tables from the REST API');
    }
  }

  Future<TableModel> findATable(String id) async {
    var client = http.Client();

    final url =
        Uri.parse("http://" + host + ":" + port + "/api/v1/tables/" + id);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return parseTable(response.body);
    } else {
      throw Exception('Unable to fetch table from the REST API');
    }
  }

  Future<void> updateTable(TableModel tableModel) async {
    var client = http.Client();

    final url = Uri.parse(
        "http://" + host + ":" + port + "/api/v1/tables/" + tableModel.id);

    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      "authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjM3MjE3NzhhNDJmODdiN2IzYWE2MTMiLCJpYXQiOjE2NDc3ODAyMTZ9.48h3hUNrZ6uxXO0LqzDSwlkEVWXkUxeBEtFCtXrQIw8"
    };
    var body = {
      "name": tableModel.name,
      "menus": List<String>.from(tableModel.menus),
      "total": tableModel.total,
      "status": tableModel.status,
      "approvedBy": tableModel.approvedBy
    };
    var response =
        await client.post(url, headers: header, body: json.encode(body));
    if (response.statusCode == 200) {
    } else {
      throw Exception('Unable to update table');
    }
  }
}
