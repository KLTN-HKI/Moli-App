import 'package:formz/formz.dart';

class DateTimePicker extends FormzInput<DateTime?, bool> {
  const DateTimePicker.pure([super.value]) : super.pure();
  const DateTimePicker.dirty(super.value) : super.dirty();

  @override
  bool? validator(DateTime? value) {
    if (value == null) {
      return false;
    }

    return null;
  }
}
