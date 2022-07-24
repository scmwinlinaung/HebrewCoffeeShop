import 'package:flutter/material.dart';
import 'package:mobile/helper/responsive.dart';
import 'package:mobile/view/widget/full_screens/dashboard/background.dart';
import 'package:mobile/view/widget/full_screens/dashboard/login_signup_btn.dart';
import 'package:mobile/view/widget/full_screens/dashboard/welcome_image.dart';

class FullWelcomeScreen extends StatelessWidget {
  static String title = "Full Welcome Screen";
  static String routeName = "/full-welcome";
  const FullWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const WelcomeImage()),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignupBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: const MobileWelcomeScreen(),
          ),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const WelcomeImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 10,
              child: LoginAndSignupBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
