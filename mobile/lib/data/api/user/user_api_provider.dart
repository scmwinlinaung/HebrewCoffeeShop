import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/data/model/user/user_model.dart';

class UserApiProvider {
  final String host;
  final String port;
  UserApiProvider({required this.host, required this.port});
  List<UserModel> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }

  UserModel parseUser(String responseBody) {
    final parsed = json.decode(responseBody);
    return UserModel.fromJson(parsed);
  }

  Future<UserModel> profile(String token) async {
    var client = http.Client();
    final url =
        Uri.parse("http://" + host + ":" + port + "/api/v1/users/me/profile");
    Map<String, String> header = {
      "Content-Type": "application/json; charset=UTF-8",
      "authorization": token
    };
    var response = await client.get(url, headers: header);
    if (response.statusCode == 200) {
      return parseUser(response.body);
    } else {
      throw Exception("Unable to get profile");
    }
  }

  Future<List<UserModel>> findAllUsers() async {
    var client = http.Client();
    final url = Uri.parse("http://" + host + ":" + port + "/api/v1/users");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return parseUsers(response.body);
    } else {
      throw Exception('Unable to fetch users from the REST API');
    }
  }
}
