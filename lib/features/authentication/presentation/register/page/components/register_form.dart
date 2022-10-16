import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:moli_shared/moli_shared.dart';
import '../../cubit/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (RegisterState previous, RegisterState current) =>
          previous.status != current.status,
      listener: (BuildContext context, RegisterState state) {
        if (state.status == FormzStatus.submissionFailure) {
          context.showDefaultDialog(
              title: const Text('Dang ky that bai'),
              content: Text(state.status.toString()));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            _PhoneNumberInput(),
            SizedBox(height: 12),
            _EmailInput(),
            SizedBox(height: 12),
            _PasswordInput(),
            SizedBox(height: 12),
            _ConfirmPasswordInput(),
          ],
        ),
      ),
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (RegisterState previous, RegisterState current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (BuildContext context, RegisterState state) {
        return FloatingLabelInput(
          key: const Key('Register_form_phonenumber_input'),
          labelText: context.l10n.phone_number,
          enabled: false,
          noteInitValue: state.phoneNumber.value,
          onChanged: (String phoneNumber) {},
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

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (RegisterState previous, RegisterState current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (BuildContext context, RegisterState state) {
        return FloatingLabelInput(
          key: const Key('Register_form_phonenumber_input'),
          labelText: 'Email',
          noteInitValue: state.email.value,
          onChanged: (String email) =>
              context.read<RegisterCubit>().emailChanged(email),
          icon: IconAssets.icMobile,
          keyboardType: TextInputType.emailAddress,
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
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (RegisterState previous, RegisterState current) =>
          previous.password != current.password,
      builder: (BuildContext context, RegisterState state) {
        return FloatingLabelInput(
          key: const Key('Register_form_password_input'),
          labelText: context.l10n.password,
          onChanged: (String password) =>
              context.read<RegisterCubit>().passwordChanged(password),
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

class _ConfirmPasswordInput extends StatefulWidget {
  const _ConfirmPasswordInput();

  @override
  State<_ConfirmPasswordInput> createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<_ConfirmPasswordInput> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (RegisterState previous, RegisterState current) =>
          previous.password != current.password ||
          previous.confirmPassword != current.confirmPassword,
      builder: (BuildContext context, RegisterState state) {
        return FloatingLabelInput(
          key: const Key('Register_form_password_input'),
          labelText: context.l10n.confirm_password,
          onChanged: (String password) =>
              context.read<RegisterCubit>().confirmPasswordChanged(password),
          icon: IconAssets.icLock,
          showHiddenInput: _toggle,
          obscureText: _obscureText,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorPalettes.neutral80),
          ),
          errorText: state.confirmPassword.error?.text(),
        );
      },
    );
  }
}
