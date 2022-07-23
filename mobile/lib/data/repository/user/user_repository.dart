import 'package:mobile/data/api/user/user_api_provider.dart';
import 'package:mobile/data/model/user/user_model.dart';

class UserRepository {
  final String host;
  final String port;
  late UserApiProvider userApiProvider;
  UserRepository({required this.host, required this.port}) {
    userApiProvider = UserApiProvider(host: host, port: port);
  }

  Future<List<UserModel>> findAllUsers() async =>
      await userApiProvider.findAllUsers();

  Future<UserModel> profile(String token) async =>
      await userApiProvider.profile(token);
}
