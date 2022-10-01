import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class MoliCrashlytics {
  const MoliCrashlytics._();

  /// Singleton instance of AntoreeDynamicLink Helper
  static MoliCrashlytics? _instance;

  /// Get instance of this class
  static MoliCrashlytics get instance =>
      _instance ??= const MoliCrashlytics._();

  static FirebaseCrashlytics? _crashlytics;

  static Future<void> initialize() async {
    _crashlytics ??= FirebaseCrashlytics.instance;

    await _crashlytics!.setCrashlyticsCollectionEnabled(!kDebugMode);
    FlutterError.onError = _crashlytics!.recordFlutterError;
  }

  Future<void> recordError(dynamic exception, StackTrace? stack) async {
    _crashlytics!.recordError(exception, stack);
  }
}
