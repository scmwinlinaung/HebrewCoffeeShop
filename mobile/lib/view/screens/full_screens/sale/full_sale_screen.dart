// Flutter: External Libraries
import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/sale_provider.dart';
import 'package:mobile/view/widget/full_screens/sale/sale_listing_widget.dart';
import 'package:provider/provider.dart';

// FullSaleScreen: StatefulWidget Class
class FullSaleScreen extends StatefulWidget {
  // Static: Class Properties
  static String title = "Full Order Screen";
  static String routeName = "/full-order";

  // Constructor
  const FullSaleScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FullSaleScreen> createState() => _FullSaleScreenState();
}

class _FullSaleScreenState extends State<FullSaleScreen> {
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
        body: SaleListingWidget(
          saleProvider: provider,
        ));
  }
}
