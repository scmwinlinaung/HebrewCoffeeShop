import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/expense_provider.dart';
import 'package:mobile/data/model/expense/expense_model.dart';
import 'package:mobile/view/screens/full_screens/expense/full_expense_detail_screen.dart';
import 'package:mobile/view/widget/full_screens/expense/expense_text_form_field.dart';

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
            columnSpacing: MediaQuery.of(context).size.width / 10,
            horizontalMargin: 5,
            rowsPerPage: 10,
            showCheckboxColumn: false,
            dataRowHeight: MediaQuery.of(context).size.height * 0.06,
            header: const Text(""),
            actions: [
              IconButton(
                  onPressed: () {
                    showCreateExpenseDialog();
                  },
                  icon: const Icon(Icons.add_circle,
                      color: Colors.green, size: 35))
            ],
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

  Future showCreateExpenseDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Create Expense",
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
              ExpenseTextFormField(
                controller: nameCtrl,
                errorMessage: 'Please set title ',
                hintText: 'Title',
                textInputType: TextInputType.name,
                iconData: Icons.people,
              ),
              ExpenseTextFormField(
                controller: classificationCtrl,
                errorMessage: 'Please set category',
                hintText: 'Category',
                textInputType: TextInputType.name,
                iconData: Icons.category,
              ),
              ExpenseTextFormField(
                controller: priceCtrl,
                errorMessage: 'Please set total',
                hintText: 'Total',
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
          Navigator.pushNamed(
            context,
            FullExpenseDetailScreen.routeName,
          );
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
