import 'package:flutter/material.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';

import 'components/appointment_detail_body.dart';

class AppointmentDetailPage extends StatelessWidget {
  const AppointmentDetailPage({super.key, required this.id});

  final int id;

  static const String routePath = 'appointment-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        // transparentAppBar: true,
        titleText: 'Lịch hẹn khám',
        routeBack: Routes.appointment,
      ),
      body: SafeArea(
        child: AppointmentDetailBody(),
      ),
      bottomNavigationBar: AppOutlinedButton(
        onPressed: () {},
        child: Text('Hủy lịch'),
      ).marginAll(16),
    );
  }
}
