import 'package:firebase_core/firebase_core.dart';

import 'app/app.dart';
import 'config/bootstrap.dart';
import 'config/firebase_options.stg.dart';

void main() {
  bootstrap(() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    return const MoliApp();
  });
}
