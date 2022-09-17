import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/app/bloc/app/app_bloc.dart';
import 'package:moli_app/app/page/moli_app.dart';
import 'package:moli_app/app/router/router.dart';
import 'package:moli_app/features/authentication/authentication.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final AuthenticationBloc? appBloc =
        MoliApp.navigatorKey.currentContext?.read<AuthenticationBloc>();
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (appBloc?.state == const AuthenticationState.authenticated()) {
      // if user is authenticated we continue
      resolver.next();
    } else {
      // we redirect the user to our login page
      router.replaceAll(
        [
          const LoginRoute(),
        ],
      );
    }
  }
}
