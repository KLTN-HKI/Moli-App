import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/features/authentication/presentation/login/page/components/login_body.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/shared/common/common.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (BuildContext context) => LoginCubit(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,

        appBar: AppBar(
            backgroundColor: ColorPalettes.transparent,
            systemOverlayStyle: context.isDarkMode
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark),
        extendBodyBehindAppBar: true,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: const LoginBody(),
        ),
      ),
    );
  }
}
