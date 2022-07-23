import 'package:flutter/material.dart';
import 'package:mobile/constant/constants.dart';
import 'package:mobile/view/screens/full_screens/home/full_signup_screen.dart';
import 'package:mobile/view/screens/full_screens/home/full_login_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                FullLoginScreen.routeName,
              );
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(
              context,
              FullSignUpScreen.routeName,
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Constants.kPrimaryLightColor,
            elevation: 0.5,
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
          child: Text(
            "Sign Up".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
