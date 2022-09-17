import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/features/authentication/presentation/login/page/components/login_body.dart';
import 'package:moli_app/shared/common/common.dart';

import '../cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.isDarkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit(
              authenticationBloc: getIt(),
              authenticationRepository: getIt(),
              authenticationService: getIt(),
            ),
            child: const LoginBody(),
          ),
        ),
      ),
    );
  }
}
