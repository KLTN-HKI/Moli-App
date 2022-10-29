import 'package:formz/formz.dart';
import 'package:moli_app/features/appointment/domain/formz/description.dart';

import 'datetime_picker.dart';
import 'email.dart';
import 'name.dart';
import 'phone_number.dart';

enum AppointmentValidationError { invalid }

class AppointmentForm with FormzMixin {
  const AppointmentForm({
    this.appointmentDate = const DateTimePicker.pure(),
    this.description = const Description.pure(),
    this.patientName = const Name.pure(),
    this.emailPatient = const Email.pure(),
    this.patientRealPhoneNumber = const PhoneNumber.pure(),
  });

  final DateTimePicker appointmentDate;

  final Description description;

  final Email emailPatient;

  final Name patientName;

  final PhoneNumber patientRealPhoneNumber;

  AppointmentForm copyWith({
    DateTimePicker? appointmentDate,
    Description? description,
    Email? emailPatient,
    Name? patientName,
    PhoneNumber? patientRealPhoneNumber,
    FormzInputStatus? status,
  }) {
    return AppointmentForm(
      appointmentDate: appointmentDate ?? this.appointmentDate,
      emailPatient: emailPatient ?? this.emailPatient,
      patientName: patientName ?? this.patientName,
      description: description ?? this.description,
      patientRealPhoneNumber:
          patientRealPhoneNumber ?? this.patientRealPhoneNumber,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      <FormzInput<dynamic, dynamic>>[
        description,
        emailPatient,
        patientName,
        patientRealPhoneNumber,
      ];
}
