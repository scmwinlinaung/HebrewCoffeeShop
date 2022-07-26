import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/expense_provider.dart';
import 'package:mobile/data/model/expense/expense_model.dart';

import 'expense_text_form_field.dart';

class ExpenseDetailWidget extends StatefulWidget {
  final ExpenseModel expenseModel;
  final ExpenseProvider expenseProvider;

  const ExpenseDetailWidget(
      {Key? key, required this.expenseModel, required this.expenseProvider})
      : super(key: key);

  @override
  State<ExpenseDetailWidget> createState() => _ExpenseDetailWidgetState();
}

class _ExpenseDetailWidgetState extends State<ExpenseDetailWidget> {
  final TextEditingController nameCtrl = TextEditingController();

  final TextEditingController classificationCtrl = TextEditingController();

  final TextEditingController priceCtrl = TextEditingController();

  final TextEditingController statusCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        maximumSize: const Size(double.infinity, 56),
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      onPressed: () async {},
                      child: Text("Update".toUpperCase()),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
