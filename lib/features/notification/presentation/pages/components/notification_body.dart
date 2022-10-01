import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/notification/domain/user_notification.dart';
import 'package:moli_app/shared/shared.dart';

import '../../cubit/notification_list_cubit.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationListCubit, NotificationListState>(
      listener: (BuildContext context, NotificationListState state) {
        if (state.exception != null) {
          context.showNetworkExceptionDialog(state.exception!);
        }
      },
      builder: (BuildContext context, NotificationListState state) {
        final Iterable<Widget> items = state.notificationlist.notifications
            .map(NotificationBody.buildNotificationItem)
            .whereType<Widget>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppText.t0('Trước đó').weight500.paddingSymmetric(horizontal: 16),
            ...items,
            if (state.isLoading) const LoadingIndicator()
          ].applySeparator(separator: const SizedBox(height: 16)),
        );
      },
    );
  }

  static Widget? buildNotificationItem(UserNotification item) {
    if (item.type == 2) {
      // return NotificationAbsence.buildNotificationAbsence(item);
    }

    return null;
  }
}
