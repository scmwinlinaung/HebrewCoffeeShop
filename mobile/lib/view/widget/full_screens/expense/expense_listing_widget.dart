import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/expense_provider.dart';
import 'package:mobile/data/model/expense/expense_model.dart';

class ExpenseListingWidget extends StatefulWidget {
  final ExpenseProvider expenseProvider;
  const ExpenseListingWidget({Key? key, required this.expenseProvider})
      : super(key: key);

  @override
  State<ExpenseListingWidget> createState() => _ExpenseListingWidgetState();
}

class _ExpenseListingWidgetState extends State<ExpenseListingWidget> {
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
            columns: [
              DataColumn(
                  label: Text('Title',
                      style: Theme.of(context).textTheme.headline6)),
              DataColumn(
                  label: Text('Category',
                      style: Theme.of(context).textTheme.headline6)),
              DataColumn(
                  label: Text('Total',
                      style: Theme.of(context).textTheme.headline6)),
              const DataColumn(label: Text(''))
            ],
            source: ExpenseTableData(
                menus: [ExpenseModel.Empty()],
                context: context,
                provider: widget.expenseProvider)));
  }
}

class ExpenseTableData extends DataTableSource {
  final List<ExpenseModel> menus;
  final BuildContext context;
  final ExpenseProvider provider;

  ExpenseTableData(
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
          //   FullExpenseDetailScreen.routeName,
          // );
        },
        onLongPress: () {},
        cells: [
          DataCell(Text(menus[index].title)),
          DataCell(
            Text(menus[index].category),
          ),
          DataCell(Text(menus[index].total.toString())),
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
