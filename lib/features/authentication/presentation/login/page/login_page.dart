import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moli_app/features/authentication/presentation/login/page/components/login_body.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../check_user/page/check_phone_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (BuildContext context) => LoginCubit(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: context.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: const LoginBody(),
          ),
          bottomNavigationBar: AppOutlinedButton(
            key: const Key('regiter_button'),
            expandedWith: false,
            primary: context.colorScheme.primary,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            onPressed: () =>
                context.push('${Routes.auth}/${CheckPhoneNumberPage.routeName}'),
            child: Text(context.l10n.register),
          ).marginSymmetric(horizontal: 48, vertical: 16),
        ),
      ),
    );
  }
}
