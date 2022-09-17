import 'package:formz/formz.dart';

enum AddressValidationError { invalid }

class Address extends FormzInput<String, AddressValidationError> {
  const Address.pure([super.value = '']) : super.pure();
  const Address.dirty([super.value = '']) : super.dirty();

  /* static final RegExp _AddressRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'); */

  @override
  AddressValidationError? validator(String? value) {
    if (value == null) {
      return AddressValidationError.invalid;
    } else {
      return null;
    }
  }
}
