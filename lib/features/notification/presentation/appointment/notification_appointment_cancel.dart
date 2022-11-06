import 'package:flutter/material.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../domain/user_notification.dart';
import '../notification/pages/components/notification_body.dart';

class NotificationAppointmentCancel extends StatelessWidget {
  const NotificationAppointmentCancel({super.key, required this.notification});

  final UserNotification notification;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        MyNotification().dispatch(context);
        context.goRouter.pushNamed('appointment-detail',
            params: <String, String>{
              'appointmentId': '${notification.appointment?.appointmentUuid}'
            });
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: BaseCard(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(),
              crossAxisAlignment: CrossAxisAlignment.start,
              leading: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  // RoundedImage(
                  //   size: 44,
                  // ),
                  SvgPicture.asset(
                    IconAssets.icCanceledRed,
                    height: 48,
                  ),
                  // Positioned(
                  //     bottom: -1,
                  //     right: 0,
                  //     child: NotificationAppointmentIcon())
                ],
              ),
              leadingGap: 8,
              content: <Widget>[
                AppText.l0('${notification.detail}').weight600,
                const SizedBox(height: 4),
                AppText.l1(
                  '${DateTimeUtils.relative(notification.createdAt)}',
                  color: context.colorScheme.onSurface.withOpacity(0.5),
                ).weight600,
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            alignment: Alignment.center,
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: !notification.read ? context.colorScheme.primary : null,
              shape: BoxShape.circle,
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 24),
    );
  }
}
