import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();
  const Password.dirty([super.value = '']) : super.dirty();

  /* static final RegExp _passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'); */

  @override
  PasswordValidationError? validator(String? value) {
    if (value != null) {
      return null;
    } else {
      return PasswordValidationError.invalid;
    }
    // return _passwordRegex.hasMatch(value!)
    //     ? null
    //     : PasswordValidationError.invalid;
  }
}
