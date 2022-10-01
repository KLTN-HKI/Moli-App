import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

class AppointmentDetailPage extends StatelessWidget {
  const AppointmentDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        title: Text('Lịch hẹn khám $id'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: <BoxShadow>[
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText.t0('Bác sĩ ...').bold,
                  SizedBox(height: 12.w),
                  AppText.t1('Bệnh nhân ...').bold,
                  SizedBox(height: 12.w),
                  AppText.t1(' ...').bold,
                  SizedBox(height: 12.w),
                  AppText.t1('Ghi chú...').bold,
                  SizedBox(height: 12.w),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
