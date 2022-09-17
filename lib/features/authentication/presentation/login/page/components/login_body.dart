import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moli_app/app/router/router.dart';
import 'package:moli_app/features/authentication/presentation/check_user/page/check_phone_page.dart';
import 'package:moli_app/features/authentication/presentation/widget/background_stack.dart';
import 'package:moli_app/shared/shared.dart';

import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundStack(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.d1(context.l10n.log_in).weight500,
                SizedBox(height: 4.w),
                AppText.b1(context.l10n.login_to_continue),
                const LoginForm(),
              ],
            ),
          ),
          OutlinedButton(
            key: const Key('regiter_button'),
            onPressed: () =>
                context.router.navigateNamed(CheckPhoneNumberPage.routeName),
            child: Text(context.l10n.register),
          ).paddingAll(24.w)
        ],
      ),
    );
  }
}
