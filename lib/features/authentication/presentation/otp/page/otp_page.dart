import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

import 'components/otp_body.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  static const String routeName = 'one-time-password';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: ColorPalettes.transparent,
            systemOverlayStyle: context.isDarkMode
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark),
        body: const OTPBody(),
      ),
    );
  }
}
