import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/config/dependency_container.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/shared/shared.dart';

import '../cubit/register_cubit.dart';
import 'components/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.isDarkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: ColorPalettes.transparent,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(
              authenticationRepository: getIt(),
            ),
            child: const RegisterBody(),
          ),
        ),
      ),
    );
  }
}
