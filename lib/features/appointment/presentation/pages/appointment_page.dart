import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appointment),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.filter_add),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          itemBuilder: (BuildContext context, int index) => BaseCard(
            // backgroundColor: context.colorScheme.primary,
            headerFlex: true,
            withShadow: true,
            padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 16.w),
            shadowBox: [
              BoxShadow(
                  blurRadius: 17, color: ColorPalettes.black.withOpacity(.03)),
              BoxShadow(
                  blurRadius: 5, color: ColorPalettes.black.withOpacity(.04)),
              BoxShadow(
                  blurRadius: 2, color: ColorPalettes.black.withOpacity(.04)),
              BoxShadow(
                  blurRadius: 0.8, color: ColorPalettes.black.withOpacity(.06)),
            ],
            header: <Widget>[
              AppText.t0('bác sĩ $index'),
              SizedBox(height: 4.w),
              AppText.b2('Tại phòng khám...'),
              SizedBox(height: 4.w),
              AppText.b2('Vào lúc'),
            ],
            trailing: const AppIcon(IconAssets.icArrowRight),
        ),
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 12.w),
          itemCount: 10,
        ),
      ),
    );
  }
}
