import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/expense_provider.dart';
import 'package:mobile/data/model/expense/expense_model.dart';
import 'package:mobile/view/widget/full_screens/expense/expense_detail_widget.dart';
import 'package:provider/provider.dart';

class FullExpenseDetailScreen extends StatefulWidget {
  // Static: Class Properties
  static String title = "Full Expense Detail Screen";
  static String routeName = "/full-sale-detail";

  // Constructor
  const FullExpenseDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FullExpenseDetailScreen> createState() =>
      _FullExpenseDetailScreenState();
}

class _FullExpenseDetailScreenState extends State<FullExpenseDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        appBar: AppBar(
            backgroundColor: Colors.grey[200],
            shadowColor: Colors.grey[200],
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  // clear the selected table

                  Navigator.of(context).pop();
                })),
        backgroundColor: Colors.grey[200],
        body: ExpenseDetailWidget(
          expenseModel: ExpenseModel.Empty(),
          expenseProvider: provider,
        ));
  }
}
