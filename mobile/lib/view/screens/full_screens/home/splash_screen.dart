import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'welcome_screen.dart';

class FullSplashScreen extends StatefulWidget {
  static String title = "Full Splash Screen";
  static String routeName = "/full-splash";

  const FullSplashScreen({Key? key}) : super(key: key);

  @override
  State<FullSplashScreen> createState() => _FullSplashScreenState();
}

class _FullSplashScreenState extends State<FullSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(
        context,
        FullWelcomeScreen.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 242, 237),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/logo.jpeg',
            height: 120,
            width: 120,
          ),
          const SizedBox(
            height: 30,
          ),
          if (Platform.isIOS)
            const CupertinoActivityIndicator(
              radius: 20,
            )
          else
            const CircularProgressIndicator(
              color: Colors.white,
            )
        ]),
      ),
    );
  }
}
