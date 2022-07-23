import 'package:flutter/material.dart';

const Color PRIMARY_COLOR = Colors.blue;
const Color BACKGROUND_COLOR = Color(0xffE2E7F2);

class CustomBottomNavigationBar extends StatelessWidget {
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int) onChange;
  final int currentIndex;

  CustomBottomNavigationBar(
      {required this.itemColor,
      required this.currentIndex,
      required this.children,
      required this.onChange});

  void _changeIndex(int index) {
    if (onChange != null) {
      onChange(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children.map((item) {
          // var color = item.color ?? itemColor;
          var icon = item.icon;
          var label = item.label;
          int index = children.indexOf(item);
          return GestureDetector(
            onTap: () {
              _changeIndex(index);
            },
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: currentIndex == index
                        ? Theme.of(context).primaryColor
                        : Colors.white),
                child: Icon(icon,
                    size: 25,
                    color: currentIndex == index ? Colors.white : null)),
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData icon;
  final String label;
  final Color color;

  CustomBottomNavigationItem(
      {required this.icon, required this.label, required this.color});
}
