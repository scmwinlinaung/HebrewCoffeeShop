import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/sale_provider.dart';
import 'package:mobile/data/model/sale/sale_model.dart';
import 'package:mobile/view/screens/full_screens/sale/full_sale_detail_screen.dart';

import 'sale_text_form_field.dart';

class SaleListingWidget extends StatefulWidget {
  final SaleProvider saleProvider;
  const SaleListingWidget({Key? key, required this.saleProvider})
      : super(key: key);

  @override
  State<SaleListingWidget> createState() => _SaleListingWidgetState();
}

class _SaleListingWidgetState extends State<SaleListingWidget> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController classificationCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController statusCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: PaginatedDataTable(
            columnSpacing: MediaQuery.of(context).size.width / 20,
            horizontalMargin: 5,
            rowsPerPage: 10,
            showCheckboxColumn: false,
            dataRowHeight: MediaQuery.of(context).size.height * 0.06,
            columns: [
              DataColumn(
                  label: Text('Menu',
                      style: Theme.of(context).textTheme.headline6)),
              DataColumn(
                  label: Text('Classification',
                      style: Theme.of(context).textTheme.headline6)),
              DataColumn(
                  label: Text('Amount',
                      style: Theme.of(context).textTheme.headline6)),
              DataColumn(
                  label: Text('Price',
                      style: Theme.of(context).textTheme.headline6)),
              const DataColumn(label: Text(''))
            ],
            source: SaleTableData(
                menus: [SaleModel.Empty()],
                context: context,
                provider: widget.saleProvider)));
  }
}

class SaleTableData extends DataTableSource {
  final List<SaleModel> menus;
  final BuildContext context;
  final SaleProvider provider;

  SaleTableData(
      {required this.menus, required this.context, required this.provider});
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => menus.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
        onSelectChanged: (value) {
          Navigator.pushNamed(
            context,
            FullSaleDetailScreen.routeName,
          );
        },
        onLongPress: () {},
        cells: [
          DataCell(Text(menus[index].menu)),
          DataCell(
            Text(menus[index].menuClassification),
          ),
          DataCell(Text(menus[index].amount.toString())),
          DataCell(Text(menus[index].price.toString())),
          DataCell(IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {},
          ))
        ]);
  }
}
