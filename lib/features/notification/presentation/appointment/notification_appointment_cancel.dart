import 'package:flutter/material.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../domain/user_notification.dart';
import 'notification_appointment.dart';

class NotificationAppointmentCancel extends StatelessWidget {
  const NotificationAppointmentCancel({super.key, required this.notification});

  final UserNotification notification;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: BaseCard(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(),
            crossAxisAlignment: CrossAxisAlignment.start,
            leading: Stack(
              clipBehavior: Clip.none,
              children: const <Widget>[
                RoundedImage(
                  size: 44,
                ),
                Positioned(
                    bottom: -1, right: 0, child: NotificationAppointmentIcon())
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
      ],
    ).paddingSymmetric(horizontal: 24);
  }
}
