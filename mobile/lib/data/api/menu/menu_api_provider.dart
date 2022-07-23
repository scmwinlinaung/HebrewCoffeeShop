import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/data/model/menu/menu_model.dart';

class MenuApiProvider {
  final String host;
  final String port;
  MenuApiProvider({required this.host, required this.port});
  List<MenuModel> parseMenus(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MenuModel>((json) => MenuModel.fromJson(json)).toList();
  }

  MenuModel parseMenu(String responseBody) {
    final parsed = json.decode(responseBody);
    return MenuModel.fromJson(parsed);
  }

  Future<List<MenuModel>> findAllMenus() async {
    var client = http.Client();

    final url = Uri.parse("http://" + host + ":" + port + "/api/v1/menus");

    var response = await client.get(url);

    if (response.statusCode == 200) {
      return parseMenus(response.body);
    } else {
      throw Exception('Unable to fetch menus from the REST API');
    }
  }

  Future<MenuModel> findAMenu(String id) async {
    var client = http.Client();

    final url =
        Uri.parse("http://" + host + ":" + port + "/api/v1/menus/" + id);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return parseMenu(response.body);
    } else {
      throw Exception('Unable to fetch menu from the REST API');
    }
  }
}
