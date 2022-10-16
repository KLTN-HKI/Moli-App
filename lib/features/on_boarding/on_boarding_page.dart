import 'package:flutter/material.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_shared/moli_shared.dart';

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
    // context.read<AuthenticationBloc>().add(const AuthenticationEvent.init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: <PageViewModel>[
        PageViewModel(
          title: 'Đặt lịch nhanh chóng',
          bodyWidget: AppText.b0(''),
          image: Image.asset(
            ImageAssets.doctors,
            fit: BoxFit.cover,
          ),
          decoration: const PageDecoration(
            titlePadding: EdgeInsets.zero,
            imageFlex: 2,
            imagePadding: EdgeInsets.zero,
          ),
        ),
        PageViewModel(
          title: 'Đội ngũ bác sĩ tận tâm, uy tín',
          bodyWidget: AppText.b0(''),
          image: Image.asset(ImageAssets.doctors1),
          decoration: const PageDecoration(
            titlePadding: EdgeInsets.zero,
            imageFlex: 2,
            imagePadding: EdgeInsets.zero,
          ),
        ),
      ],
      showBackButton: true,
      curve: Curves.fastOutSlowIn,
      dotsDecorator: DotsDecorator(activeColor: context.colorScheme.primary),
      back: const Icon(Icons.arrow_back),
      done:
          const Text('Bắt đầu', style: TextStyle(fontWeight: FontWeight.w600)),
      next:
          const Text('Tiếp tục', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => context.goRouter.push(Routes.auth),
    );
  }
}
