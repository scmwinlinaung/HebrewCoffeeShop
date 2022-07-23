// Flutter:: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:getwidget/getwidget.dart';
import 'package:mobile/data/model/menu/menu_model.dart';

// DropdownWidget: StatefulWidget Class
class MenuDropdownWidget extends StatefulWidget {
  // Final: Class Properties
  final MenuModel currentValue;
  final List<MenuModel> itemList;
  final Function(Object?)? function;

  // Constructor
  const MenuDropdownWidget({
    required this.currentValue,
    required this.itemList,
    required this.function,
    Key? key,
  }) : super(key: key);

  @override
  _MenuDropdownWidgetState createState() => _MenuDropdownWidgetState();
}

class _MenuDropdownWidgetState extends State<MenuDropdownWidget> {
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
          items: widget.itemList.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.name),
            );
          }).toList(),
          onChanged: widget.function,
        ),
      ),
    );
  }
}
