import 'package:flutter/material.dart';
import 'package:mobile/constant/constants.dart';
import 'package:mobile/controller/provider/authentication_provider.dart';
import 'package:mobile/view/screens/full_screens/home/full_home_screen.dart';
import 'package:mobile/view/screens/full_screens/home/full_signup_screen.dart';

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
                primary: Theme.of(context).primaryColor,
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(
                  context,
                  FullHomeScreen.routeName,
                );
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: Constants.defaultPadding),
        ],
      ),
    );
  }
}
