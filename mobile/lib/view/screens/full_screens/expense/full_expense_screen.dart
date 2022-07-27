// Flutter: External Libraries
import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/expense_provider.dart';
import 'package:mobile/controller/provider/menu_provider.dart';
import 'package:mobile/view/widget/full_screens/expense/expense_listing_widget.dart';
import 'package:mobile/view/widget/full_screens/menu/menu_listing_widget.dart';
import 'package:provider/provider.dart';

// FullExpenseScreen: StatefulWidget Class
class FullExpenseScreen extends StatefulWidget {
  // Static: Class Properties
  static String title = "Full Menu Screen";
  static String routeName = "/full-expense";

  // Constructor
  const FullExpenseScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FullExpenseScreen> createState() => _FullExpenseScreenState();
}

class _FullExpenseScreenState extends State<FullExpenseScreen> {
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
        body: ExpenseListingWidget(
          expenseProvider: provider,
        ));
  }
}
