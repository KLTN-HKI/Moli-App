import 'package:moli_app/config/config.dart';
import 'package:moli_shared/moli_shared.dart';

import '../domain/user_notification.dart';

import 'notification_endpoint.dart';
import 'notification_repository.dart';

class NotificationRepositoryApi implements NotificationRepository {
  NotificationRepositoryApi() : _apiService = getIt();

  final ApiService _apiService;

  @override
  Future<UserNotificationList> fetchUserNotificationList({required JSON data}) {
    return _apiService.getDocumentData<UserNotificationList>(
      endpoint: ApiEndpoint.notification(NotificationEndpoint.all),
      queryParams: <String, dynamic>{
        'size': 10,
        ...data,
      },
      converter: UserNotificationList.fromJson,
    );
  }

  @override
  Future<void> readNotification(int notificationId) {
    return _apiService.updatePartialData<void>(
      endpoint: ApiEndpoint.notification(NotificationEndpoint.readNotification,
          id: notificationId),
      data: <String, dynamic>{},
      converter: (JSON responseBody) => <String, dynamic>{},
    );
  }
}
