import 'package:flutter/material.dart';
import 'package:mobile/constant/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "လယ်ဂျာ အသစ်ဖွင့်မလား။ " : "လယ်ဂျာ ဖွင့်ပြီးသားလား။ ",
          style: const TextStyle(color: Constants.primaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "လယ်ဂျာ အသစ်ဖွင့်ပါ" : "လယ်ဂျာရွေးပါ",
            style: const TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
