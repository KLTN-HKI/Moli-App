import 'package:flutter/material.dart';
import 'package:moli_app/constants/icon_assets.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/features/notification/presentation/notification_detail/notification_detail_page.dart';
import 'package:moli_app/shared/shared.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        title: Text(context.l10n.notification),
        canBack: false,
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) => ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const NotificationDetailPage(),
                        ),
                      );
                    },
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.w),
                    leading: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        RoundedImage(
                            size: 48.w, imageURL: ImageAssets.randomAvatar),
                        Positioned(
                            bottom: -4.w,
                            right: -4.w,
                            child: AppIcon(
                              IconAssets.icNotiCalendar,
                              size: 24,
                              // color: context.colorScheme.errorContainer,
                            )),
                      ],
                    ),
                    title: AppText.t1(context.l10n.notification),
                    subtitle: AppText.l2(context.l10n.few_seconds_ago),
                    trailing: Container(
                      width: 8.w,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: context.colorScheme.primary,
                          shape: BoxShape.circle),
                    ),
                  ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(),
              itemCount: 10)),
    );
  }
}
