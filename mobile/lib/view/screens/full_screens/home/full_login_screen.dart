import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/authentication_provider.dart';
import 'package:mobile/helper/responsive.dart';
import 'package:mobile/view/widget/full_screens/dashboard/login_form.dart';
import 'package:mobile/view/widget/full_screens/dashboard/login_screen_top_image.dart';
import 'package:provider/provider.dart';

import '../../../widget/full_screens/dashboard/background.dart';

class FullLoginScreen extends StatelessWidget {
  static String title = "Full Login Screen";
  static String routeName = "/full-login";
  const FullLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginForm(
                        provider: provider,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(
                provider: provider,
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
