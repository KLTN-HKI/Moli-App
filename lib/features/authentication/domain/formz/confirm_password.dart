import 'package:formz/formz.dart';
import 'package:moli_app/shared/shared.dart';

enum ConfirmPasswordValidationError {
  invalid,
  notSame;

  String? text() {
    switch (this) {
      case ConfirmPasswordValidationError.invalid:
        return 'Mật khẩu phải lớn hơn 6 kí tự';
      case ConfirmPasswordValidationError.notSame:
        return 'Mật khẩu không giống nhau';
    }
  }
}

class ConfirmPassword
    extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPassword.pure({this.password = ''}) : super.pure('');
  const ConfirmPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  final String password;

  @override
  ConfirmPasswordValidationError? validator(String? value) {
    if (StringUtils.isNullOrBlank(value) || (value!.length < 6)) {
      return ConfirmPasswordValidationError.invalid;
    } else if (value != password) {
      return ConfirmPasswordValidationError.notSame;
    } else {
      return null;
    }
  }
}
