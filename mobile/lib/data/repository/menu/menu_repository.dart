import 'package:mobile/data/api/menu/menu_api_provider.dart';
import 'package:mobile/data/model/menu/menu_model.dart';

class MenuRepository {
  final String host;
  final String port;
  late MenuApiProvider menuApiProvider;
  MenuRepository({required this.host, required this.port}) {
    menuApiProvider = MenuApiProvider(host: host, port: port);
  }
  Future<List<MenuModel>> findAllMenus() async =>
      await menuApiProvider.findAllMenus();

  Future<MenuModel> findAMenu(String id) async =>
      await menuApiProvider.findAMenu(id);
}
