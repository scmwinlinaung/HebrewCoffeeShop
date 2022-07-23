import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constant/constants.dart';
import 'package:mobile/controller/provider/authentication_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'already_have_an_account.dart';
import '../../../screens/full_screens/home/full_login_screen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _openingDateController =
        TextEditingController();
    final TextEditingController _ledgerNoController = TextEditingController();
    final TextEditingController _betLimitController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'လယ်ဂျာနံပါတ် ထည့်ပါ';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            cursorColor: Constants.primaryColor,
            controller: _ledgerNoController,
            decoration: const InputDecoration(
              hintText: "username",
              prefixIcon: Padding(
                padding: EdgeInsets.all(Constants.defaultPadding),
                child: Icon(Icons.people),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: Constants.defaultPadding),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ထီဖွင့်ရက်ရွေးပါ';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              cursorColor: Constants.primaryColor,
              decoration: const InputDecoration(
                hintText: "phone number",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(Constants.defaultPadding),
                  child: Icon(Icons.phone),
                ),
              ),
              controller: _openingDateController,
              onTap: () async {},
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: Constants.defaultPadding),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'အများဆုံးထိုးကြေးသတ်မှတ်ပါ';
                }
                return null;
              },
              controller: _betLimitController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              cursorColor: Constants.primaryColor,
              decoration: const InputDecoration(
                hintText: "password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(Constants.defaultPadding),
                  child: Icon(Icons.key),
                ),
              ),
            ),
          ),
          const SizedBox(height: Constants.defaultPadding / 2),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
            onPressed: () async {},
            child: Text("Register".toUpperCase()),
          ),
          const SizedBox(height: Constants.defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.popAndPushNamed(
                context,
                FullLoginScreen.routeName,
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
