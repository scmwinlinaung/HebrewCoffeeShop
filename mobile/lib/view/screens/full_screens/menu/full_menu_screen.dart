// Flutter: External Libraries
import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/menu_provider.dart';
import 'package:mobile/controller/provider/table_provider.dart';
import 'package:mobile/view/widget/full_screens/menu/menu_detail_widget.dart';
import 'package:provider/provider.dart';

// FullMenuScreen: StatefulWidget Class
class FullMenuScreen extends StatefulWidget {
  // Static: Class Properties
  static String title = "Full Menu Screen";
  static String routeName = "/full-menu";

  // Constructor
  const FullMenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FullMenuScreen> createState() => _FullMenuScreenState();
}

class _FullMenuScreenState extends State<FullMenuScreen> {
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
    final provider = Provider.of<MenuProvider>(context);
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
        body: MenuDetailWidget(
          menuProvider: provider,
        ));
  }
}
