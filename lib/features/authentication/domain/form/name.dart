import 'package:formz/formz.dart';

enum NameValidationError { invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure([super.value = '']) : super.pure();
  const Name.dirty([super.value = '']) : super.dirty();

  /* static final RegExp _NameRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'); */

  @override
  NameValidationError? validator(String? value) {
    if (value != null) {
      return null;
    } else {
      return NameValidationError.invalid;
    }
    // return _NameRegex.hasMatch(value!)
    //     ? null
    //     : NameValidationError.invalid;
  }
}
