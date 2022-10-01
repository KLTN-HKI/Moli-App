import 'package:flutter/material.dart';
import 'package:moli_app/shared/shared.dart';

import 'otp_form.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          context.l10n.enter_sent_otp,
          style: context.textTheme.headlineMedium!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        AppText.b1(context.l10n.enter_otp_sent_via_your_sms),
        const Center(child: OtpForm()),
      ].applySeparator(separator: const SizedBox(height: 24)),
    ).paddingAll(16);
  }
}
