import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/notification/domain/user_notification.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../application/bloc/notification_bloc.dart';
import '../../../appointment/notification_appointment.dart';
import '../../cubit/notification_list_cubit.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationBloc, NotificationState>(
      listenWhen: (NotificationState previous, NotificationState current) =>
          previous.notificationsLastest != current.notificationsLastest,
      listener: (BuildContext context, NotificationState state) {
        context.read<NotificationListCubit>().fetchData();
      },
      child: BlocConsumer<NotificationListCubit, NotificationListState>(
        listener: (BuildContext context, NotificationListState state) {
          if (state.exception != null) {
            context.showNetworkExceptionDialog(state.exception!);
          }
        },
        builder: (BuildContext context, NotificationListState state) {
          switch (state.status) {
            case StateStatus.loading:
              return const LoadingIndicator();
            case StateStatus.success:
              final UserNotificationList list = state.notificationlist;
              if (list.notifications.isNotEmpty) {
                return ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    if (index >= list.notifications.length &&
                        list.pagination.hasMore) {
                      return const LoadingIndicator();
                    }
                    final UserNotification notification =
                        list.notifications[index];
                    return buildNotificationItem(notification) ??
                        const SizedBox();
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 16),
                  itemCount:
                      list.notifications.length + (state.isLoading ? 1 : 0),
                );
              } else {
                return CustomErrorWidget(
                  message: 'Không có thông báo nào',
                  child: Image.asset(
                    ImageAssets.notFound,
                    height: 250,
                    width: 250,
                  ),
                );
              }
            case StateStatus.initial:
            case StateStatus.updated:
            case StateStatus.failure:
              return const SizedBox();
          }
        },
      ),
    );
  }

  static Widget? buildNotificationItem(UserNotification item) {
    Widget? body;
    body = NotificationAppointment.buildNotificationAppointment(item);
    if (body != null) {
      return Builder(builder: (BuildContext context) {
        return NotificationListener<MyNotification>(
          onNotification: (Object? notificationInfo) {
            if (notificationInfo is MyNotification) {
              if (kDebugMode) {
                log('NotificationAbsenceSubmitted');
              }

              context.read<NotificationListCubit>().readNotification(item.id!);
            }

            return true;
          },
          child: body!,
        );
      });
    }
    return body;
  }
}

class MyNotification extends Notification {}
