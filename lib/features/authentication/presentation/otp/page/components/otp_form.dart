import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/features/authentication/presentation/register/page/register_page.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';
import 'package:pinput/pinput.dart';

import '../../cubit/otp_cubit.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;
  late final PinTheme submittedPinTheme;
  late final TextEditingController _controller;
  String? _otp;

  late OtpCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<OtpCubit>();
    _controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initApp();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Pinput(
          controller: _controller,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          length: 6,
          showCursor: false,
          hapticFeedbackType: HapticFeedbackType.vibrate,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          onChanged: (String value) => setState(() => _otp = value),
          onCompleted: context.read<OtpCubit>().verifyOTP,
        ),
        const SizedBox(height: 12),
        TweenAnimationBuilder<Duration>(
            tween: Tween<Duration>(
                begin: const Duration(minutes: 1), end: Duration.zero),
            duration: const Duration(minutes: 1),
            builder: (BuildContext context, Duration duration, Widget? child) {
              return Text.rich(
                TextSpan(
                  text: context.l10n.resend_otp_after,
                  style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w600),
                  children: <InlineSpan>[
                    TextSpan(
                      text: '${duration.inSeconds}s',
                      style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.error,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              );
            }),
        BlocConsumer<OtpCubit, OtpState>(
          bloc: _cubit,
          listener: (BuildContext context, OtpState state) {
            state.whenOrNull(
              failed: (String exception) {
                _controller.clear();
              },
              success: () => context.goRouter
                  .go('${Routes.auth}/${RegisterPage.routeName}'),
            );
          },
          builder: (BuildContext context, OtpState state) {
            return AppElevatedButton(
              isLoading:
                  state.maybeWhen(loading: () => true, orElse: () => false),
              onPressed: () => context.read<OtpCubit>().verifyOTP(_otp ?? ''),
              dense: false,
              borderRadius: BorderRadius.circular(12),
              primary: context.colorScheme.primary,
              child: Text(context.l10n.next),
            );
          },
        ).paddingAll(16).paddingSymmetric(horizontal: 16),
      ],
    );
  }

  void _initApp() {
    defaultPinTheme = PinTheme(
      width: 44,
      height: 52,
      textStyle: context.textTheme.titleLarge,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalettes.neutral80),
        borderRadius: BorderRadius.circular(4),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: context.colorScheme.primary),
      ),
      height: 56,
      width: 48,
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: context.colorScheme.secondary.withOpacity(0.1),
      ),
    );
  }
}
