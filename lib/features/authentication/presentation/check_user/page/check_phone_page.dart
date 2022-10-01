import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/authentication/authentication.dart';
import 'package:moli_app/features/authentication/presentation/register/cubit/register_cubit.dart';
import 'package:moli_app/features/authentication/presentation/widget/background_stack.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';

import '../../otp/cubit/otp_cubit.dart';
import '../cubit/phone_cubit.dart';

class CheckPhoneNumberPage extends StatelessWidget {
  const CheckPhoneNumberPage({super.key});
  static const String routeName = 'check-exist-phone-number';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: const HeaderAppBar(transparentAppBar: true),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const PhoneBody(),
      ),
    );
    /* return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<PhoneCubit>(
          create: (_) => PhoneCubit(),
        ),
        BlocProvider<OtpCubit>(
          create: (_) => OtpCubit(),
        ),
        BlocProvider<RegisterCubit>(
          create: (_) => RegisterCubit(LoginCubit()),
        ),
      ],
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: const HeaderAppBar(transparentAppBar: true),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: const PhoneBody(),
        ),
      ),
    ); */
  }
}

class PhoneBody extends StatelessWidget {
  const PhoneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneCubit, PhoneState>(
      listener: (BuildContext context, PhoneState state) {
        if (state.status == FormzStatus.submissionSuccess) {
          context.read<RegisterCubit>().phoneChanged(state.phoneNumber.value);
          context.read<OtpCubit>().sendOTP('+84${state.phoneNumber.value}');
        } else if (state.status == FormzStatus.submissionFailure) {
          context.showDefaultDialog(
              crossAxisAlignment: CrossAxisAlignment.center,
              image: Image.asset(ImageAssets.errorResponse),
              title: AppText.b0('Số điện thoại đã tồn tại').weight500,
              content: AppText.b0(''),
              actions: <Widget>[
                AppElevatedButton(
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  child: Text(context.l10n.i_got_it),
                )
              ]);
        }
      },
      child: BlocListener<OtpCubit, OtpState>(
        listener: (BuildContext context, OtpState state) {
          state.whenOrNull(
            codeSent: () =>
                context.goRouter.push('${Routes.auth}/${OTPPage.routeName}'),
          );
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
        return BlocBuilder<OtpCubit, OtpState>(
          builder: (BuildContext context, OtpState otpState) {
            return AppElevatedButton(
              key: const Key('check_phone_submit_button'),
              onPressed: state.status.isValidated
                  ? () => context.read<PhoneCubit>().checkPhoneNumberExist()
                  : null,
              height: 64,
              isLoading:
                  otpState.maybeWhen(loading: () => true, orElse: () => false),
              primary: context.theme.colorScheme.primary,
              child: Text(context.l10n.to_continue),
            );
          },
        );
      },
    );
  }
}
