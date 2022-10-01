import 'package:flutter/material.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../widget/background_stack.dart';
import 'register_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundStack(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppText.d2(context.l10n.register).weight500,
            SizedBox(height: 4.w),
            AppText.b1('Vui lòng điền đầy đủ thông tin để đăng ký'),
            const RegisterForm()
          ],
        ),
      ),
    );
  }
}
