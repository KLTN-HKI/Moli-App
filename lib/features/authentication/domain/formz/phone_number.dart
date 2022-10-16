import 'package:formz/formz.dart';
import 'package:moli_shared/moli_shared.dart';

class PhoneNumber extends FormzInput<String, bool> {
  const PhoneNumber.pure() : super.pure('');

  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  @override
  bool? validator(String? value) {
    if (StringUtils.isNullOrBlank(value) ||
        !StringUtils.isPhoneNumber(value!)) {
      return false;
    }

    return null;
  }
}
