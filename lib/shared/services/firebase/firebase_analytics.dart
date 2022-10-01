import 'package:firebase_analytics/firebase_analytics.dart';

class MoliAnalytics {
  const MoliAnalytics._();

  /// Singleton instance of AntoreeDynamicLink Helper
  static MoliAnalytics? _instance;

  /// Get instance of this class
  static MoliAnalytics get instance => _instance ??= const MoliAnalytics._();

  static FirebaseAnalytics? _analytics;

  static FirebaseAnalyticsObserver? _observer;

  static Future<void> initialize() async {
    _analytics ??= FirebaseAnalytics.instance;
    _observer ??= FirebaseAnalyticsObserver(analytics: _analytics!);
  }

  FirebaseAnalyticsObserver get observer => _observer!;
}
