class ApiEndpoint {
  const ApiEndpoint._();

  /// Returns the path for an course [endpoint].
  static String notification(NotificationEndpoint endpoint, {int? id}) {
    const String path = '/api';
    switch (endpoint) {
      case NotificationEndpoint.all:
        return '$path/notifications';
    }
  }
}

enum NotificationEndpoint {
  all,
}
