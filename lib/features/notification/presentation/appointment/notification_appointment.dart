import 'package:flutter/material.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/shared/shared.dart';

import '../../domain/user_notification.dart';
import 'notification_appointment_cancel.dart';
import 'notification_appointment_remind.dart';

class NotificationAppointment {
  const NotificationAppointment._();

  static Widget? buildNotificationAppointment(UserNotification item) {
    if (item.channel == NotificationChannel.remind) {
      return NotificationAppointmentRemind(notification: item);
    } else if (item.channel == NotificationChannel.cancel) {
      return NotificationAppointmentCancel(notification: item);
    }
    return null;
  }
}

class NotificationAppointmentIcon extends StatelessWidget {
  const NotificationAppointmentIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          color: const Color(0xFFffdad4),
          shape: BoxShape.circle,
          border: Border.all(color: context.colorScheme.background)),
      child: Image.asset(ImageAssets.appIcon),
    );
  }
}
