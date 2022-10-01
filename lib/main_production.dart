import 'package:firebase_core/firebase_core.dart';
import 'package:moli_app/config/firebase_options.dart';

import 'app/app.dart';
import 'config/bootstrap.dart';

void main() {
  bootstrap(() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    return const MoliApp();
  });
}
