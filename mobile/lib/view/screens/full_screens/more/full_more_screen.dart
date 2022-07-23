// Flutter: External Libraries
import 'package:flutter/material.dart';

// FullMoreScreen: StatefulWidget Class
class FullMoreScreen extends StatefulWidget {
  // Static: Class Properties
  static String title = "Full More Screen";
  static String routeName = "/full-more";

  // Constructor
  const FullMoreScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FullMoreScreen> createState() => _FullMoreScreenState();
}

class _FullMoreScreenState extends State<FullMoreScreen> {
  // Final: Class Properties
  final String title = "Rates Table";
  final String subTitle = "This is rates table screen.";
  final String learnMoreText = "Learn More";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return const Text("Way");
  }
}
