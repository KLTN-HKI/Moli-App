import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';

import '../cubit/register_cubit.dart';
import 'components/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (BuildContext context, AuthenticationState state) {
        state.whenOrNull(
            authenticated: (_) => context.goRouter.go(Routes.home));
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: ColorPalettes.transparent,
          systemOverlayStyle: context.isDarkMode
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: const RegisterBody(),
        ),
        bottomNavigationBar: const _RegisterSubmitted(),
      ),
    );
  }
}

class _RegisterSubmitted extends StatelessWidget {
  const _RegisterSubmitted();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (RegisterState previous, RegisterState current) =>
          previous.status != current.status,
      builder: (BuildContext context, RegisterState state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
          child: AppElevatedButton(
            key: const Key('Register_form_submit_button'),
            onPressed: () => context.read<RegisterCubit>().register(),
            height: 64,
            isLoading: state.status.isSubmissionInProgress,
            primary: context.theme.colorScheme.primary,
            child: Text(context.l10n.register),
          ),
        );
      },
    );
  }
}
