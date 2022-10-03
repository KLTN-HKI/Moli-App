import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/appointment/presentation/pages/appointment_detail/appointment_detail.dart';
import 'package:moli_app/shared/shared.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 16.w),
      content: <Widget>[
        AppText.t0('bác sĩ ${index + 1}'),
        SizedBox(height: 4.w),
        AppText.b2('Tại phòng khám...'),
        SizedBox(height: 4.w),
        AppText.b2('Vào lúc ...'),
      ],
      trailing: const AppIcon(IconAssets.icArrowRight),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => AppointmentDetailPage(
              id: index,
            ),
          )),
    );
  }
}
