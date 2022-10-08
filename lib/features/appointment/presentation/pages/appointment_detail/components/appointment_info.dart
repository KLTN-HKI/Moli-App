import 'package:flutter/material.dart';
import 'package:moli_app/shared/shared.dart';

import 'appointment_card.dart';

class AppointmentInfo extends StatelessWidget {
  const AppointmentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText.t0('Phòng khám').bold,
          SizedBox(height: 12.w),
          AppText.t0('Trạng thái'),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.b0('Mã lịch hẹn'),
              AppText.b0('text').weight600,
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.b0('Ngày khám'),
              AppText.b0('text').weight600,
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.b0('Giờ khám'),
              AppText.b0(
                'text',
                color: context.colorScheme.error,
              ).weight600,
            ],
          ),
          // const SizedBox(height: 12),
        ],
      ),
    );
  }
}
