

import 'package:moli_app/shared/shared.dart';

abstract class AppointmentRepository{

  Future<void> bookDoctor({required JSON data});

}
