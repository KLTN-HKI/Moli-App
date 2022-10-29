import 'package:flutter/material.dart';
import 'package:moli_app/features/authentication/presentation/widget/background_stack.dart';
import 'package:moli_shared/moli_shared.dart';

import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundStack(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(child: AppText.d1(context.l10n.log_in).weight500),
          AppText.b1(context.l10n.login_to_continue),
          const LoginForm(),
        ],
      ),
    );
  }
}
