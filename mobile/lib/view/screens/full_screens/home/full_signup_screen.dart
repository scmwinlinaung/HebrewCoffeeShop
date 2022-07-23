import 'package:flutter/material.dart';
import 'package:mobile/constant/constants.dart';
import 'package:mobile/helper/responsive.dart';
import 'package:mobile/view/widget/full_screens/dashboard/background.dart';
import 'package:mobile/view/widget/full_screens/dashboard/sign_up_top_image.dart';
import 'package:mobile/view/widget/full_screens/dashboard/signup_form.dart';

class FullSignUpScreen extends StatelessWidget {
  static String title = "Full Signup Screen";
  static String routeName = "/full-signup";
  const FullSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileSignupScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: SignUpScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 450,
                      child: SignUpForm(),
                    ),
                    SizedBox(height: Constants.defaultPadding / 2),
                    // SocalSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignUpScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}
