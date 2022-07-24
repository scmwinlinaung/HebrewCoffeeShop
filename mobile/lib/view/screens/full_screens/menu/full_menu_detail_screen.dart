import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/menu_provider.dart';
import 'package:mobile/data/model/menu/menu_model.dart';
import 'package:mobile/view/widget/full_screens/menu/menu_detail_widget.dart';
import 'package:provider/provider.dart';

class FullMenuDetailScreen extends StatefulWidget {
  // Static: Class Properties
  static String title = "Full Menu Detail Screen";
  static String routeName = "/full-menu-detail";

  // Constructor
  const FullMenuDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FullMenuDetailScreen> createState() => _FullMenuDetailScreenState();
}

class _FullMenuDetailScreenState extends State<FullMenuDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
          menuModel: MenuModel.Empty(),
          menuProvider: provider,
        ));
  }
}
