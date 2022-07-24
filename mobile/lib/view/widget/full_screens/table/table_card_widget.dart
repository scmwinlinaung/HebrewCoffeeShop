import 'package:flutter/material.dart';
import 'package:mobile/view/screens/full_screens/table/full_table_detail_screen.dart';

class TableCardWidget extends StatelessWidget {
  final String id;
  final String tableName;
  final double total;
  const TableCardWidget(
      {Key? key,
      required this.id,
      required this.tableName,
      required this.total})
      : super(key: key);

  void goToTableDetail(BuildContext context) {
    Navigator.pushNamed(context, FullTableDetailScreen.routeName,
        arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          goToTableDetail(context);
        },
        child: Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/table.png",
                width: 50,
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Chip(
                shadowColor: Colors.white,
                backgroundColor: Colors.green,
                label: Text(
                  tableName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Chip(
                shadowColor: Colors.white,
                avatar: const Icon(
                  Icons.monetization_on,
                  size: 20,
                  color: Colors.white,
                ),
                backgroundColor: const Color.fromARGB(164, 165, 150, 8),
                label: Text(
                  total.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
