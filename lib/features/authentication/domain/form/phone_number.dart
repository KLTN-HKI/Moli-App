import 'package:formz/formz.dart';

enum PhoneNumberValidationErorr { invalid }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationErorr> {
  const PhoneNumber.pure() : super.pure('');

  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  static final RegExp _phoneNumberRegExp = RegExp(
    r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$',
  );

  @override
  PhoneNumberValidationErorr? validator(String? value) {
    if (value != null) {
      return _phoneNumberRegExp.hasMatch(value)
          ? null
          : PhoneNumberValidationErorr.invalid;
    } else {
      return PhoneNumberValidationErorr.invalid;
    }
  }
}
