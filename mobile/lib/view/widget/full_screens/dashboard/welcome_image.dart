import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/constant/constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Text(
        //   "Welcome From Hebrews Coffee Shop",
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        // ),
        // const SizedBox(height: Constants.defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 3,
              child: SvgPicture.asset(
                "assets/icons/plate.svg",
              ),
            ),
            const Spacer(),
          ],
        ),
        // const SizedBox(height: Constants.defaultPadding * 2),
      ],
    );
  }
}
