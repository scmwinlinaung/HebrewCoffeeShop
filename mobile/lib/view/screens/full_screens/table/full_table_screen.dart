// Flutter: External Libraries
import 'package:flutter/material.dart';
import 'package:mobile/constant/table_data.dart';
import 'package:mobile/controller/provider/table_provider.dart';
import 'package:mobile/view/widget/full_screens/table/table_card_widget.dart';
import 'package:provider/provider.dart';

// FullTableScreen: StatefulWidget Class
class FullTableScreen extends StatefulWidget {
  // Static: Class Properties
  static String title = "Full Dashboard Screen";
  static String routeName = "/full-table";

  // Constructor
  const FullTableScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FullTableScreen> createState() => _FullTableScreenState();
}

class _FullTableScreenState extends State<FullTableScreen> {
  // Final: Class Properties
  final String title = "Rates Table";
  final String subTitle = "This is rates table screen.";
  final String learnMoreText = "Learn More";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TableProvider tableProvider = Provider.of<TableProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    elevation: 2,
                    child: Icon(
                      Icons.add,
                      size: 70,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                if (tableProvider.getTables().isNotEmpty)
                  GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 8.0,
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      children: List.generate(
                          tableProvider.getTables().length - 1, (index) {
                        return TableCardWidget(
                          id: tableProvider.getTables()[index].id,
                          tableName: tableProvider.getTables()[index].name,
                          total: tableProvider.getTables()[index].amount,
                        );
                      }, growable: true)),
              ],
            )));
  }
}
