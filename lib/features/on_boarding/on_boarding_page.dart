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
        PageViewModel(
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              AppText.b0('Bước 1:').bold,
              const SizedBox(height: 8),
              AppText.b0(
                  'Chọn bệnh viện/bác sĩ phù hợp với nhu cầu bệnh lý của bạn'),
              const SizedBox(height: 16),
              AppText.b0('Bước 2:').bold,
              const SizedBox(height: 8),
              AppText.b0(
                  'Tạo lịch hẹn với đầy đủ thông tin bệnh nhân, thời gian khám mong muốn'),
              const SizedBox(height: 16),
              AppText.b0('Bước 3:').bold,
              const SizedBox(height: 8),
              AppText.b0(
                  'Xác nhận tạo lịch hẹn khám và chờ xác nhận từ bác sĩ'),
              const SizedBox(height: 16),
            ],
          ),
          titleWidget: AppText.h2('Đặt lịch đơn giản chỉ với vài bước').bold,
          image: Image.asset(ImageAssets.appointment),
          decoration: const PageDecoration(
            bodyAlignment: Alignment.center,
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
