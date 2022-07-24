// Flutter: External Libraries
import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/table_provider.dart';
import 'package:mobile/data/model/table/table_model.dart';
import 'package:mobile/view/screens/full_screens/table/full_table_screen.dart';
import 'package:mobile/view/widget/full_screens/table/table_detail_widget.dart';
import 'package:provider/provider.dart';

// FullTableDetailScreen: StatefulWidget Class
class FullTableDetailScreen extends StatefulWidget {
  // Static: Class Properties
  static String title = "Full Dashboard Screen";
  static String routeName = "/full-table-detail";

  // Constructor
  const FullTableDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FullTableDetailScreen> createState() => _FullTableDetailScreenState();
}

class _FullTableDetailScreenState extends State<FullTableDetailScreen> {
  // Final: Class Properties
  final String title = "Rates Table";
  final String subTitle = "This is rates table screen.";
  final String learnMoreText = "Learn More";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant FullTableDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TableProvider tableProvider = Provider.of<TableProvider>(context);
    String id = ModalRoute.of(context)?.settings.arguments as String;

    if (tableProvider.getSelectedTable().name == '') {
      tableProvider.findATable(id);
    }
    return Scaffold(
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
                  tableProvider.setSelectedTable(TableModel.empty());
                  Navigator.of(context).pop();
                })),
        backgroundColor: Colors.grey[200],
        body: const TableDetailWidget());
  }
}
