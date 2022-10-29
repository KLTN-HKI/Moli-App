import 'package:formz/formz.dart';

enum DescriptionValidationError { invalid }

class Description extends FormzInput<String, DescriptionValidationError> {
  const Description.pure([super.value = '']) : super.pure();
  const Description.dirty([super.value = '']) : super.dirty();

  /* static final RegExp _DescriptionRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'); */

  @override
  DescriptionValidationError? validator(String? value) {
    // if (value == null) {
    //   return DescriptionValidationError.invalid;
    // } else {
    return null;
    // }
  }
}
