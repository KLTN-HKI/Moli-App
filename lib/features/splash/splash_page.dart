import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moli_app/app/bloc/bloc.dart';
import 'package:moli_app/app/router/router.dart';
import 'package:moli_app/features/authentication/authentication.dart';
import 'package:moli_app/features/dashboard/dashboard.dart';

import '../../constants/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (BuildContext context, AppState state) {
        state.maybeWhen(
          orElse: () {},
          unauthenticated: () => AutoRouter.of(context)
              .replaceAll(<PageRouteInfo<dynamic>>[const LoginRoute()]),
          authenticated: () => AutoRouter.of(context)
              .replaceAll(<PageRouteInfo<dynamic>>[const DashboardRoute()]),
        );
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Image.asset(
                ImageAssets.background,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(IconAssets.appIcon),
                SizedBox(height: 12.r),
                Text(
                  AppConstant.appName,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
