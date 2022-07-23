import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback function;

  const PrimaryButton({Key? key, required this.title, required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          minimumSize: const Size.fromHeight(40),
        ),
        onPressed: function,
        child: Text(title,
            style: const TextStyle(fontSize: 16, color: Colors.white)));
  }
}
