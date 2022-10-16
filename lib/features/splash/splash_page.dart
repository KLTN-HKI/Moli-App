import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_shared/moli_shared.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (BuildContext context, AuthenticationState state) {
        state.whenOrNull(
          unauthenticated: () => context.goRouter.go(Routes.auth),
          authenticated: (_) => context.goRouter.go(Routes.home),
          firstTime: () => context.goRouter.go(Routes.onBoarding),
        );
      },
      child: Scaffold(
        backgroundColor:
            context.isDarkMode ? ColorPalettes.white : ColorPalettes.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              JsonAssets.medical,
              width: context.width,
              height: context.width,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 12),
            AppText.d1(
              AppConstant.appName,
              fontWeight: FontWeight.w700,
              color: ColorPalettes.primary40,
            )
          ],
        ),
      ),
    );
  }
}
