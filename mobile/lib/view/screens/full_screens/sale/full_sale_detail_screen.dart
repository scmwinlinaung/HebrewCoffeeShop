import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/sale_provider.dart';
import 'package:mobile/data/model/sale/sale_model.dart';
import 'package:mobile/view/widget/full_screens/sale/sale_detail_widget.dart';
import 'package:provider/provider.dart';

class FullSaleDetailScreen extends StatefulWidget {
  // Static: Class Properties
  static String title = "Full Sale Detail Screen";
  static String routeName = "/full-sale-detail";

  // Constructor
  const FullSaleDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FullSaleDetailScreen> createState() => _FullSaleDetailScreenState();
}

class _FullSaleDetailScreenState extends State<FullSaleDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SaleProvider>(context);
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
        body: SaleDetailWidget(
          saleModel: SaleModel.Empty(),
          saleProvider: provider,
        ));
  }
}
