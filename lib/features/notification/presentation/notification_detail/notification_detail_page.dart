import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/shared/shared.dart';

class NotificationDetailPage extends StatelessWidget {
  const NotificationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        title: Text(context.l10n.notification + context.l10n.detail),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.background,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 17,
                        color: ColorPalettes.black.withOpacity(.15)),
                    BoxShadow(
                        blurRadius: 5,
                        color: ColorPalettes.black.withOpacity(.04)),
                    BoxShadow(
                        blurRadius: 2,
                        color: ColorPalettes.black.withOpacity(.04)),
                    BoxShadow(
                        blurRadius: .8,
                        color: ColorPalettes.black.withOpacity(.05)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText.b0('Bạn có 1 thông báo'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
