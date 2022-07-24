// Flutter:: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:getwidget/getwidget.dart';
import 'package:mobile/data/model/menu/menu_model.dart';

// DropdownWidget: StatefulWidget Class
class MenuStatusDropdownWidget extends StatefulWidget {
  // Final: Class Properties
  final MenuStatus currentValue;
  final Function(Object?)? function;

  // Constructor
  const MenuStatusDropdownWidget({
    required this.currentValue,
    required this.function,
    Key? key,
  }) : super(key: key);

  @override
  _MenuStatusDropdownWidgetState createState() =>
      _MenuStatusDropdownWidgetState();
}

class _MenuStatusDropdownWidgetState extends State<MenuStatusDropdownWidget> {
  // Final: Class Properties
  final Color _dropdownButtonColor = const Color(0xfff0f5f9);

  // Lifecycle Hook Methods
  @override
  initState() {
    super.initState();
  }

  // Build Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: _dropdownButtonColor,
      ),
      child: DropdownButtonHideUnderline(
        child: GFDropdown<Object?>(
          style: Theme.of(context).textTheme.bodyText1,
          dropdownButtonColor: _dropdownButtonColor,
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          value: widget.currentValue,
          items: MenuStatus.values.map((MenuStatus menuStatus) {
            return DropdownMenuItem(
              value: menuStatus,
              child: Text(menuStatus.name),
            );
          }).toList(),
          onChanged: widget.function,
        ),
      ),
    );
  }
}
