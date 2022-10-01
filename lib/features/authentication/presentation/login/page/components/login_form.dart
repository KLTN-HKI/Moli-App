import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/shared/shared.dart';

import '../../cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state.status == FormzStatus.submissionFailure &&
            state.exception is NetworkException) {
          context.showNetworkExceptionDialog(state.exception!);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: <Widget>[
            const _PhoneNumberInput(),
            SizedBox(height: 12.w),
            const _PasswordInput(),
            SizedBox(height: 60.w),
            const _LoginSubmitted(),
            SizedBox(height: 16.w),
            InkWell(
              onTap: () {},
              child: AppText.l0(
                context.l10n.forgot_password,
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginSubmitted extends StatelessWidget {
  const _LoginSubmitted();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (LoginState previous, LoginState current) =>
          previous.status != current.status,
      builder: (BuildContext context, LoginState state) {
        return AppElevatedButton(
          key: const Key('login_form_submit_button'),
          onPressed: () => context
              .read<LoginCubit>()
              .login(state.phoneNumber.value, state.password.value),
          height: 64,
          isLoading: state.status.isSubmissionInProgress,
          primary: context.theme.colorScheme.primary,
          child: Text(context.l10n.log_in),
        );
      },
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (LoginState previous, LoginState current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (BuildContext context, LoginState state) {
        return FloatingLabelInput(
          key: const Key('login_form_phonenumber_input'),
          labelText: context.l10n.phone_number,
          onChanged: (String phoneNumber) =>
              context.read<LoginCubit>().phoneNumberChanged(phoneNumber),
          onSubmitted: (_) => context
              .read<LoginCubit>()
              .login(state.phoneNumber.value, state.password.value),
          icon: IconAssets.icMobile,
          keyboardType: TextInputType.phone,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorPalettes.neutral80),
          ),
          errorText: state.phoneNumber.invalid ? 'sdt khong hop le' : null,
        );
      },
    );
  }
}

class _PasswordInput extends StatefulWidget {
  const _PasswordInput();

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (LoginState previous, LoginState current) =>
          previous.password != current.password,
      builder: (BuildContext context, LoginState state) {
        return FloatingLabelInput(
          key: const Key('login_form_password_input'),
          labelText: context.l10n.password,
          onChanged: (String password) =>
              context.read<LoginCubit>().passwordChanged(password),
          icon: IconAssets.icLock,
          showHiddenInput: _toggle,
          obscureText: _obscureText,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorPalettes.neutral80),
          ),
          errorText: state.password.invalid ? 'mat khau khong hop le!' : null,
        );
      },
    );
  }
}
