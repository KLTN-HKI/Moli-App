import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:moli_app/app/router/router.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/shared/shared.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});
  static const String routeName = '/welcome';

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title 1",
          bodyWidget: AppText.b0('Do something'),
          image: Center(child: Image.network(ImageAssets.randomImage)),
        ),
        PageViewModel(
          title: "Title 2",
          bodyWidget: AppText.b0('Do something'),
          image: Center(child: Image.network(ImageAssets.randomImage)),
        ),
        PageViewModel(
          title: "Title 3",
          bodyWidget: AppText.b0('Do something'),
          image: Center(child: Image.network(ImageAssets.randomImage)),
        ),
      ],
      showBackButton: true,
      showSkipButton: false,
      back: const Icon(Icons.arrow_back),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => AutoRouter.of(context).replaceAll([const LoginRoute()]),
    );
  }
}
