import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/constant/constants.dart';

class SaleTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String errorMessage;
  final String hintText;
  final TextInputType textInputType;
  final IconData iconData;
  const SaleTextFormField(
      {Key? key,
      required this.controller,
      required this.errorMessage,
      required this.hintText,
      required this.textInputType,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        controller: controller,
        keyboardType: textInputType,
        textInputAction: TextInputAction.done,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        cursorColor: Constants.primaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(Constants.defaultPadding),
            child: Icon(iconData),
          ),
        ),
      ),
    );
  }
}
