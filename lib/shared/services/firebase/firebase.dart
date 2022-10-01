/*
Document https://firebase.flutter.dev/docs/overview/

Install and config firebase-core with CLI tools
```terminal
dart pub global activate flutterfire_cli
npm install -g firebase-tools
firebase login
flutterfire configure -a "com.ancq.moli.dev" -i "com.ancq.moli.dev" -o "lib/config/firebase_options.dev.dart" 
flutterfire configure -a "com.ancq.moli.stg" -i "com.ancq.moli.stg" -o "lib/config/firebase_options.stg.dart" 
flutterfire configure -a "com.ancq.moli" -i "com.ancq.moli" -o "lib/config/firebase_options.dart" 
``` 
*/

export 'firebase_analytics.dart';
export 'firebase_crashlytics.dart';
export 'firebase_dynamic_link.dart';
export 'firebase_messaging.dart';
export 'firebase_remote_config.dart';
