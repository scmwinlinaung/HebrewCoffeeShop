import 'package:flutter/material.dart';
import 'package:mobile/constant/table_data.dart';
import 'package:mobile/controller/provider/table_provider.dart';
import 'package:mobile/data/model/menu/menu_model.dart';
import 'package:mobile/view/widget/common/loading.dart';
import 'package:mobile/view/widget/full_screens/menu/menu_dropdown.dart';
import 'package:mobile/view/widget/common/primary_button.dart';
import 'package:provider/provider.dart';

class TableDetailWidget extends StatefulWidget {
  const TableDetailWidget({Key? key}) : super(key: key);

  @override
  State<TableDetailWidget> createState() => _TableDetailWidgetState();
}

class _TableDetailWidgetState extends State<TableDetailWidget> {
  String newMenuId = '';
  var total = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TableProvider tableProvider = Provider.of<TableProvider>(context);

    print("TOTAL = " + total.toString());
    if (tableProvider.getMenus().isEmpty) {
      tableProvider.findAllMenus();
    }
    if (total == 0.0) {
      total = tableProvider.getSelectedTable().amount;
    }
    // if (tableProvider.getMenus().isNotEmpty) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).size.height * 0.15, 20, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for (var data in tableFormData) ...[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                Widget>[
              Icon(
                data["icon"],
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
              if (data["title"] == "name")
                Chip(
                  shadowColor: Colors.white,
                  backgroundColor: Colors.green,
                  label: Text(
                    tableProvider.getSelectedTable().name.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              if (data["title"] == "menus")
                Column(
                  children: [
                    for (var i = 0;
                        i < tableProvider.getSelectedTable().menus.length;
                        i++) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              final TableProvider tableProvider =
                                  Provider.of<TableProvider>(context,
                                      listen: false);
                              tableProvider.removeMenu(i);
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 25,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                              width: 220,
                              child: MenuDropdownWidget(
                                  currentValue: tableProvider
                                      .getMenus()
                                      .firstWhere((element) =>
                                          element.id ==
                                          tableProvider
                                              .getSelectedTable()
                                              .menus[i]),
                                  itemList: tableProvider.getMenus(),
                                  function: (menu) {
                                    var newMenu = menu as MenuModel;
                                    final TableProvider _tableProvider =
                                        Provider.of<TableProvider>(context,
                                            listen: false);
                                    _tableProvider.updateMenu(
                                        tableProvider.getMenus().firstWhere(
                                            (element) =>
                                                element.id ==
                                                tableProvider
                                                    .getSelectedTable()
                                                    .menus[i]),
                                        newMenu,
                                        i);
                                  })),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                      // Container(
                      //   width: 200,
                      //   height: 50,
                      //   alignment: Alignment.center,
                      //   margin:
                      //       const EdgeInsets.symmetric(horizontal: 10.0),
                      //   child: TextFormField(
                      //     initialValue: menu,
                      //     style: Theme.of(context).textTheme.bodyMedium,
                      //   ),
                      // )
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setStateA) {
                          return IconButton(
                            onPressed: () {
                              TableProvider tableProvider =
                                  Provider.of<TableProvider>(context,
                                      listen: false);
                              final _newMenuId = newMenuId == ""
                                  ? tableProvider.getMenus().first.id
                                  : newMenuId;
                              tableProvider.addMenu(_newMenuId);
                              setState(() {
                                total += tableProvider
                                    .getMenus()
                                    .firstWhere(
                                        (element) => element.id == _newMenuId)
                                    .price;
                              });
                              tableProvider.updateAmount(total);
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.green,
                            ),
                          );
                        }),
                        SizedBox(
                            width: 220,
                            child: MenuDropdownWidget(
                                currentValue: newMenuId == ""
                                    ? tableProvider.getMenus().first
                                    : tableProvider.getMenus().firstWhere(
                                        (element) => element.id == newMenuId),
                                itemList: tableProvider.getMenus(),
                                function: (menu) {
                                  var _menu = menu as MenuModel;
                                  setState(() {
                                    newMenuId = _menu.id;
                                  });
                                })),
                      ],
                    ),
                  ],
                ),
              if (data["title"] == "amount")
                Text(
                  total.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
            ]),
            const SizedBox(
              height: 15,
            )
          ],
          Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                  title: 'Save',
                  function: () async {
                    final TableProvider _tableProvider =
                        Provider.of<TableProvider>(context, listen: false);
                    await _tableProvider
                        .updateATable(_tableProvider.getSelectedTable());
                    await _tableProvider.findAllTables();
                    Navigator.of(context).pop();
                  }))
        ],
      ),
    );
    // } else {
    //   return const Loading();
    // }
  }
}
