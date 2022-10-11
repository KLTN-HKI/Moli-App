import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../../router/router.dart';
import '../../domain/hospital.dart';

class HospitalItem extends StatelessWidget {
  const HospitalItem({super.key, required this.hospital});

  final Hospital hospital;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () => context.goRouter
          .go('${Routes.hospitals}/${hospital.id}', extra: hospital),
      child: Ink(
        width: 140.w,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: ColorPalettes.white,
          borderRadius: BorderRadius.circular(12.r),
          // border: Border.all(color: ColorPalettes.neutral90),
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 17, color: ColorPalettes.black.withOpacity(.03)),
            BoxShadow(
                blurRadius: 5, color: ColorPalettes.black.withOpacity(.04)),
            BoxShadow(
                blurRadius: 2, color: ColorPalettes.black.withOpacity(.04)),
            BoxShadow(
                blurRadius: 0.8, color: ColorPalettes.black.withOpacity(.06)),
          ],
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              ImageAssets.hospital1,
              height: 90,
              width: 90,
            ),
            SizedBox(height: 4.w),
            AppText.l0(
              hospital.hospitalName ?? 'Phòng khám ...',
              textOverflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.w),
            AppText.l1(
              hospital.hospitalAddress?.addressDetail ?? 'Địa chỉ ...',
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class HospitalListItem extends StatelessWidget {
  const HospitalListItem({super.key, required this.hospital});

  final Hospital hospital;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: () => context.goRouter
          .go('${Routes.hospitals}/${hospital.id}', extra: hospital),
      leading: const RoundedRectImage(
        height: 90,
        width: 90,
      ),
      content: <Widget>[
        AppText.l0(
          hospital.hospitalName ?? 'Phòng khám ...',
          textOverflow: TextOverflow.ellipsis,
          maxLines: 3,
        ).weight600,
        SizedBox(height: 4.w),
        AppText.l1(
          hospital.hospitalAddress?.addressDetail ?? 'Địa chỉ ...',
          maxLines: 2,
          textOverflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
