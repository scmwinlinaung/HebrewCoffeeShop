import 'package:flutter/material.dart';
import 'package:mobile/constant/constants.dart';
import 'package:mobile/controller/provider/menu_provider.dart';
import 'package:mobile/data/model/menu/menu_model.dart';
import 'package:mobile/view/screens/full_screens/menu/full_menu_detail_screen.dart';
import 'package:mobile/view/widget/full_screens/menu/menu_status_dropdown.dart';
import 'package:mobile/view/widget/full_screens/menu/menu_text_form_field.dart';

class MenuListingWidget extends StatefulWidget {
  final MenuProvider menuProvider;
  const MenuListingWidget({Key? key, required this.menuProvider})
      : super(key: key);

  @override
  State<MenuListingWidget> createState() => _MenuListingWidgetState();
}

class _MenuListingWidgetState extends State<MenuListingWidget> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController classificationCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController statusCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: PaginatedDataTable(
            columnSpacing: MediaQuery.of(context).size.width / 18,
            horizontalMargin: 5,
            rowsPerPage: 10,
            showCheckboxColumn: false,
            dataRowHeight: MediaQuery.of(context).size.height * 0.06,
            header: const Text(""),
            actions: [
              IconButton(
                  onPressed: () {
                    showCreateMenuDialog();
                  },
                  icon: const Icon(Icons.add_circle,
                      color: Colors.green, size: 35))
            ],
            columns: [
              DataColumn(
                  label: Text('Name',
                      style: Theme.of(context).textTheme.headline6)),
              DataColumn(
                  label: Text('Classification',
                      style: Theme.of(context).textTheme.headline6)),
              DataColumn(
                  label: Text('Price',
                      style: Theme.of(context).textTheme.headline6)),
              DataColumn(
                  label: Text('Status',
                      style: Theme.of(context).textTheme.headline6)),
              const DataColumn(label: Text(''))
            ],
            source: MenuTableData(
                menus: [MenuModel.Empty()],
                context: context,
                provider: widget.menuProvider)));
  }

  Future showCreateMenuDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Create Menu",
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
              MenuTextFormField(
                controller: nameCtrl,
                errorMessage: 'Please set menu name',
                hintText: 'name',
                textInputType: TextInputType.name,
                iconData: Icons.people,
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
                  currentValue: MenuStatus.active, function: (status) {})
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

class MenuTableData extends DataTableSource {
  final List<MenuModel> menus;
  final BuildContext context;
  final MenuProvider provider;

  MenuTableData(
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
            FullMenuDetailScreen.routeName,
          );
        },
        onLongPress: () {},
        cells: [
          DataCell(Text(menus[index].name)),
          DataCell(
            Text(menus[index].classification),
          ),
          DataCell(Text(menus[index].price.toString())),
          DataCell(Text(menus[index].status.name)),
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
