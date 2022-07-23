import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constant/constants.dart';
import 'package:mobile/controller/provider/authentication_provider.dart';
import 'package:mobile/view/screens/full_screens/home/full_signup_screen.dart';
import 'package:mobile/view/widget/full_screens/dashboard/already_have_an_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatelessWidget {
  final AuthenticationProvider provider;

  const LoginForm({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _usernameController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: Constants.defaultPadding),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please set username';
                }
                return null;
              },
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
              textInputAction: TextInputAction.done,
              cursorColor: Constants.primaryColor,
              decoration: const InputDecoration(
                hintText: "username",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(Constants.defaultPadding),
                  child: Icon(Icons.people),
                ),
              ),
              controller: _usernameController,
              onTap: () async {},
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: Constants.defaultPadding),
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please set username';
                }
                return null;
              },
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
              textInputAction: TextInputAction.done,
              cursorColor: Constants.primaryColor,
              decoration: const InputDecoration(
                hintText: "password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(Constants.defaultPadding),
                  child: Icon(Icons.key),
                ),
              ),
              controller: _usernameController,
              onTap: () async {},
            ),
          ),
          const SizedBox(height: Constants.defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () {},
              child: Text(
                "စတင်မည်".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: Constants.defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const FullSignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  addLedgerInfoInPrefs(int ledgerId, String ledgerNo, String betLimit,
      String openingDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('ledgerId', ledgerId);
    prefs.setString('ledgerNo', ledgerNo);
    prefs.setString('betLimit', betLimit);
  }
}
