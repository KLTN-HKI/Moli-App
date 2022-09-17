import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/authentication/presentation/register/page/register_page.dart';
import 'package:moli_app/features/authentication/presentation/widget/background_stack.dart';
import 'package:moli_app/shared/shared.dart';

import '../cubit/phone_cubit.dart';

class CheckPhoneNumberPage extends StatelessWidget {
  const CheckPhoneNumberPage({super.key});
  static const String routeName = '/check-exist-phone-number';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorPalettes.transparent,
        systemOverlayStyle: context.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocProvider<PhoneCubit>(
          create: (BuildContext context) => PhoneCubit(
            authenticationBloc: getIt(),
            authenticationRepository: getIt(),
          ),
          child: const PhoneBody(),
        ),
      ),
    );
  }
}

class PhoneBody extends StatelessWidget {
  const PhoneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneCubit, PhoneState>(
      listener: (BuildContext context, PhoneState state) {
        if (state.status == FormzStatus.submissionSuccess) {
          context.router.navigateNamed(RegisterPage.routeName);
        } else if (state.status == FormzStatus.submissionFailure) {
          context.showDefaultDialog(
              title: AppText.b0('sdsdsdsds'), content: AppText.b0('dsdasdasd'));
        }
      },
      child: BackgroundStack(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppText.t0('Nhập số điện thoại để tiếp tục'),
              const _PhoneNumberInput(),
              SizedBox(height: 40.w),
              const _CheckPhoneNumberExistButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneCubit, PhoneState>(
      buildWhen: (PhoneState previous, PhoneState current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (BuildContext context, PhoneState state) {
        return FloatingLabelInput(
          key: const Key('phone_form_phonenumber_input'),
          labelText: context.l10n.phone_number,
          onChanged: (String phoneNumber) =>
              context.read<PhoneCubit>().phoneNumberChanged(phoneNumber),
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

class _CheckPhoneNumberExistButton extends StatelessWidget {
  const _CheckPhoneNumberExistButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneCubit, PhoneState>(
      buildWhen: (PhoneState previous, PhoneState current) =>
          previous.status != current.status,
      builder: (BuildContext context, PhoneState state) {
        return AppElevatedButton(
          key: const Key('login_form_submit_button'),
          onPressed: state.status.isValidated
              ? () => context.read<PhoneCubit>().checkPhoneNumberExist()
              : null,
          height: 64,
          isLoading: state.status.isSubmissionInProgress,
          primary: context.theme.colorScheme.primary,
          child: Text(context.l10n.to_continue),
        );
      },
    );
  }
}
