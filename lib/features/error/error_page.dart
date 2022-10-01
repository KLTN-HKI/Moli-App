import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';

import 'empty.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.isDarkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Expanded(child: EmptyWidget()),
              AppTextButton(
                child: Text(context.l10n.back),
                onPressed: () =>
                    context.canPop() ? context.pop() : context.go(Routes.home),
              ),
              const SizedBox(height: 24),
              AppTextButton(
                child: Text(context.l10n.back_to_home),
                onPressed: () => context.go(Routes.home),
              )
            ],
          ),
        ),
      ),
    );
  }
}
