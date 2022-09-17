import 'package:formz/formz.dart';
import 'package:moli_app/features/authentication/domain/form/password.dart';

enum ConfirmPasswordValidationError { invalid, notSame }

class ConfirmPassword
    extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPassword.pure([super.value = '']) : super.pure();
  const ConfirmPassword.dirty([super.value = '']) : super.dirty();

  /* static final RegExp _passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'); */

  @override
  ConfirmPasswordValidationError? validator(String? value) {
    const Password password = Password.pure();
    if (value == null) {
      return ConfirmPasswordValidationError.invalid;
    } else if (value.compareTo(password.value) != 0) {
      return ConfirmPasswordValidationError.notSame;
    } else {
      return null;
    }
    // return _passwordRegex.hasMatch(value!)
    //     ? null
    //     : PasswordValidationError.invalid;
  }
}
