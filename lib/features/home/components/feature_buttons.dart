import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';

class FeatureModel {
  FeatureModel({
    required this.title,
    required this.icon,
    required this.color,
    this.routeName,
  });

  /// Feature's name
  final String title;

  /// Feature's icon
  final String icon;

  /// Feature's color
  final Color color;

  /// Feature's route
  final String? routeName;
}

class FeatureButtons extends StatelessWidget {
  const FeatureButtons({super.key});

  static List<FeatureModel> features = <FeatureModel>[
    FeatureModel(
      title: 'Đặt khám\nbác sĩ',
      icon: IconAssets.icProfileBold,
      color: ColorPalettes.primary40,
      routeName: Routes.doctors,
    ),
    FeatureModel(
      title: 'Đặt khám\nbệnh viện',
      icon: IconAssets.icCalendarBold,
      color: ColorPalettes.blueAccent,
      routeName: Routes.hospitals,
    ),
    FeatureModel(
      title: 'Hồ sơ\ny tế',
      icon: IconAssets.icBookBold,
      color: ColorPalettes.yellow,
    ),
    FeatureModel(
      title: 'Đặt khám\nbệnh viện',
      icon: IconAssets.icHistory,
      color: ColorPalettes.blueAccent,
    ),
    FeatureModel(
      title: 'Đặt khám\nbệnh viện',
      icon: IconAssets.icBrifecaseTickBold,
      color: ColorPalettes.error40,
      // routeName: AbsenceRequestScreen.routeName,
    ),
    FeatureModel(
      title: 'Kết quả\nkhám bệnh',
      icon: IconAssets.icBrifecaseTick,
      color: ColorPalettes.error40,
      // routeName: AbsenceRequestScreen.routeName,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120.w,
        crossAxisSpacing: 4.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        final FeatureModel feature = features[index];
        return InkWell(
          splashColor: ColorPalettes.transparent,
          onTap: feature.routeName != null
              ? () => context.goRouter.go(feature.routeName!)
              : null,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            // width: 80,
            padding: EdgeInsets.symmetric(vertical: 4.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: feature.color.withOpacity(.15),
                  ),
                  padding: EdgeInsets.all(14.w),
                  child: AppIcon(
                    feature.icon,
                    color: feature.color,
                  ),
                ),
                SizedBox(height: 4.w),
                Expanded(
                  child: AppText.l0(
                    feature.title,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
