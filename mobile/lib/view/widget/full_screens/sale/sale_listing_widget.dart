import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/sale_provider.dart';
import 'package:mobile/data/model/sale/sale_model.dart';

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
            columnSpacing: MediaQuery.of(context).size.width / 15,
            horizontalMargin: 5,
            rowsPerPage: 10,
            showCheckboxColumn: false,
            dataRowHeight: MediaQuery.of(context).size.height * 0.06,
            header: const Text(""),
            actions: [
              IconButton(
                  onPressed: () {
                    showCreateSaleDialog();
                  },
                  icon: const Icon(Icons.add_circle,
                      color: Colors.green, size: 35))
            ],
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

  Future showCreateSaleDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Create Sale",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20)),
        content: SingleChildScrollView(
            child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          // height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SaleTextFormField(
                controller: nameCtrl,
                errorMessage: 'Please set menu name',
                hintText: 'name',
                textInputType: TextInputType.name,
                iconData: Icons.people,
              ),
              SaleTextFormField(
                controller: classificationCtrl,
                errorMessage: 'Please set classification name',
                hintText: 'classification',
                textInputType: TextInputType.name,
                iconData: Icons.category,
              ),
              SaleTextFormField(
                controller: priceCtrl,
                errorMessage: 'Please set price',
                hintText: 'price',
                textInputType: TextInputType.number,
                iconData: Icons.monetization_on,
              ),
            ],
          ),
        )),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Create'))
        ],
      ),
    );
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
          // Navigator.pushNamed(
          //   context,
          //   FullSaleDetailScreen.routeName,
          // );
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
