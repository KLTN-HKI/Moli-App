import 'package:flutter/material.dart';
import 'package:moli_app/shared/shared.dart';

import 'appointment_card.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppointmentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.b0('Họ và tên'),
              AppText.b0(
                'text',
              ).weight600,
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.b0('Điện thoại'),
              AppText.b0(
                'text',
              ).weight600,
            ],
          ),
        ],
      ),
    );
  }
}
