import 'package:firebase_auth/firebase_auth.dart';

class MoliCloudAuthentication {
  const MoliCloudAuthentication._();

  /// Singleton instance of AntoreeMessaging Helper
  static MoliCloudAuthentication? _instance;

  /// Get instance of this class
  static MoliCloudAuthentication get instance =>
      _instance ??= const MoliCloudAuthentication._();

  static FirebaseAuth? _auth;

  /// If you're going to use other Firebase services in the background, such as
  /// Firestore, make sure you call `initializeApp` before using other Firebase services.
  /// 1. It must not be an anonymous function.
  /// 2. It must be a top-level function (e.g. not a class method which requires initialization).
  static Future<void> initialize() async {
    _auth ??= FirebaseAuth.instance;
  }

  FirebaseAuth? get auth => _auth;
}
