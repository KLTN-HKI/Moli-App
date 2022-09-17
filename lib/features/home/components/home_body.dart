import 'package:flutter/material.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/constants/icon_assets.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/features/home/components/course_banner.dart';
import 'package:moli_app/shared/shared.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 90.w,
            child: const FeatureButtons().paddingSymmetric(horizontal: 12.w),
          ),
          SizedBox(height: 12.w),
          const ChooseHospitalBuilder(),
          SizedBox(height: 12.w),
          const CourseBanner(),
          SizedBox(height: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          )
        ],
      ),
    );
  }
}

class FeatureButtons extends StatelessWidget {
  const FeatureButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 90.w,
        crossAxisSpacing: 4.w,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => InkWell(
        splashColor: ColorPalettes.transparent,
        // highlightColor: ,
        onTap: () {},
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          // height: 40,
          width: 40,
          padding: EdgeInsets.symmetric(vertical: 4.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: ColorPalettes.primary40.withOpacity(.15),
                ),
                padding: EdgeInsets.all(14.w),
                child: const AppIcon(IconAssets.icBrifecaseTickBold),
              ),
              SizedBox(height: 4.w),
              Expanded(
                child: AppText.l0(
                  'Tính năng $index',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseHospitalBuilder extends StatelessWidget {
  const ChooseHospitalBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.t0('Phòng khám gần đây')
            .weight500
            .paddingSymmetric(horizontal: 24.w),
        SizedBox(height: 12.w),
        SizedBox(
          height: 190.w,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 12.w),
            itemBuilder: (BuildContext context, int index) => InkWell(
              borderRadius: BorderRadius.circular(12.r),
              onTap: () {},
              child: Ink(
                width: 140.w,
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: ColorPalettes.white,
                  borderRadius: BorderRadius.circular(12.r),
                  // border: Border.all(color: ColorPalettes.neutral90),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 17,
                        color: ColorPalettes.black.withOpacity(.03)),
                    BoxShadow(
                        blurRadius: 5,
                        color: ColorPalettes.black.withOpacity(.04)),
                    BoxShadow(
                        blurRadius: 2,
                        color: ColorPalettes.black.withOpacity(.04)),
                    BoxShadow(
                        blurRadius: 0.8,
                        color: ColorPalettes.black.withOpacity(.06)),
                  ],
                ),
                child: Column(
                  children: [
                    RoundedRectImage(
                      imageURL: ImageAssets.randomAvatar,
                      height: 90,
                      width: 90,
                    ),
                    SizedBox(height: 4.w),
                    AppText.l0(
                      'Phòng khám $index',
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.w),
                    AppText.l1(
                      'Địa chỉ $index',
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 16.w),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
