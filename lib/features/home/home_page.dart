import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';
import 'components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowCaseWidget(
        onStart: (int? index, GlobalKey<State<StatefulWidget>> key) {
          log('onStart: $index, $key');
        },
        onComplete: (int? index, GlobalKey<State<StatefulWidget>> key) {
          log('onComplete: $index, $key');
          if (index == 4) {
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle.light.copyWith(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white,
              ),
            );
          }
        },
        autoPlayDelay: const Duration(seconds: 3),
        blurValue: 1,
        // child: SafeArea(
        //   child: HomeBody(),
        // ),
        builder: Builder(
          builder: (BuildContext context) => const SafeArea(
            child: HomeBody(),
          ),
        ),
      ),
    );
  }
}
