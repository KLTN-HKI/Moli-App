import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_shared/moli_shared.dart';
import '../../../../application/bloc/notification_bloc.dart';
import 'notification_body.dart';

class NotificationLaster extends StatelessWidget {
  const NotificationLaster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (BuildContext context, NotificationState state) {
        final Iterable<Widget> noti = state.notificationsLastest
            .map(NotificationBody.buildNotificationItem)
            .whereType<Widget>();
        if (noti.isEmpty) {
          return const SizedBox();
        }

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText.t0('Mới').weight500.paddingSymmetric(horizontal: 16),
              ...noti,
            ].applySeparator(separator: const SizedBox(height: 16)));
      },
    );
  }
}
