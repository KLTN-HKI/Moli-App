import 'package:flutter/material.dart';
import 'package:moli_app/features/appointment/presentation/pages/create_appointment/create_appointment_page.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_shared/moli_shared.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () =>
          context.goRouter.go('${Routes.doctors}/${doctor.id}', extra: doctor),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 9,
                  color: ColorPalettes.neutral50.withOpacity(.12)),
              BoxShadow(
                  offset: const Offset(0, 22),
                  blurRadius: 136,
                  color: ColorPalettes.neutral50.withOpacity(.0296)),
            ]),
        child: Column(
          children: <Widget>[
            BaseCard(
              crossAxisAlignment: CrossAxisAlignment.start,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(),
              leading: const RoundedRectImage(
                height: 95,
                width: 95,
                customErrorImage: CustomErrorImage(
                  errorImage: ImageAssets.doctor,
                ),
              ),
              leadingGap: 12,
              content: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: AppText.t0(
                        doctor.name ?? 'Bác sĩ ...',
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ).weight600,
                    ),
                    const AppIcon(
                      IconAssets.icStarBold,
                      color: ColorPalettes.coreWarning,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    AppText.t2(
                      '${doctor.rate}',
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    )
                  ],
                ),
                const SizedBox(height: 4),
                AppText.l0(
                  doctor.specialists.isNotEmpty
                      ? doctor.specialists
                          .map((Specialist e) => e.specialistName)
                          .join('\n')
                      : 'Chưa cập nhật',
                  color: context.colorScheme.primary,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                AppText.l1(
                  doctor.degree?.degreeName ?? 'Chưa cập nhật',
                  color: context.colorScheme.primary,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: AppElevatedButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                onPressed: () => context.goRouter.pushNamed(
                  CreateAppointmentPage.routeName,
                  queryParams: <String, dynamic>{'doctorId': '${doctor.id}'},
                  extra: doctor,
                ),
                expandedWith: false,
                height: 40,
                child: AppText.t1(
                  'Đặt khám',
                  color: context.colorScheme.background,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
