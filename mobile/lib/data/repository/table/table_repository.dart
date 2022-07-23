import 'package:mobile/data/api/table/table_api_provider.dart';
import 'package:mobile/data/model/table/table_model.dart';

class TableRepository {
  final String host;
  final String port;
  late TableApiProvider tableApiProvider;
  TableRepository({required this.host, required this.port}) {
    tableApiProvider = TableApiProvider(host: host, port: port);
  }
  Future<List<TableModel>> findAllTables() async =>
      await tableApiProvider.findAllTables();

  Future<TableModel> findATable(String id) async =>
      await tableApiProvider.findATable(id);
  Future<void> updateATable(TableModel tableModel) async =>
      await tableApiProvider.updateTable(tableModel);
}
