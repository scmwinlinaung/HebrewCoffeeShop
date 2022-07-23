// Flutter: External Libraries
import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/table_provider.dart';
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
    return const Text("Way");
  }
}
