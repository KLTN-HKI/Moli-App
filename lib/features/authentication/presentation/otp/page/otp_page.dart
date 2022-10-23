import 'package:flutter/material.dart';
import 'package:moli_shared/moli_shared.dart';

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
      child: const Scaffold(
        extendBodyBehindAppBar: true,
        appBar: HeaderAppBar(transparentAppBar: true),
        body: OTPBody(),
      ),
    );
  }
}
