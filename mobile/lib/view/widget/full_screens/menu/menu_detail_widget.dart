import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/menu_provider.dart';
import 'package:mobile/data/model/menu/menu_model.dart';

import 'menu_status_dropdown.dart';
import 'menu_text_form_field.dart';

class MenuDetailWidget extends StatefulWidget {
  final MenuModel menuModel;
  final MenuProvider menuProvider;

  const MenuDetailWidget(
      {Key? key, required this.menuModel, required this.menuProvider})
      : super(key: key);

  @override
  State<MenuDetailWidget> createState() => _MenuDetailWidgetState();
}

class _MenuDetailWidgetState extends State<MenuDetailWidget> {
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
                    MenuTextFormField(
                      controller: nameCtrl,
                      errorMessage: 'Please set menu name',
                      hintText: 'name',
                      textInputType: TextInputType.name,
                      iconData: Icons.menu_book,
                    ),
                    MenuTextFormField(
                      controller: classificationCtrl,
                      errorMessage: 'Please set classification name',
                      hintText: 'classification',
                      textInputType: TextInputType.name,
                      iconData: Icons.category,
                    ),
                    MenuTextFormField(
                      controller: priceCtrl,
                      errorMessage: 'Please set price',
                      hintText: 'price',
                      textInputType: TextInputType.number,
                      iconData: Icons.monetization_on,
                    ),
                    MenuStatusDropdownWidget(
                        currentValue: MenuStatus.active, function: (status) {}),
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
