import 'package:formz/formz.dart';
import 'package:moli_shared/moli_shared.dart';

class Email extends FormzInput<String, bool> {
  const Email.pure([super.value = '']) : super.pure();
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  bool? validator(String? value) {
    if (StringUtils.isNullOrBlank(value) || !StringUtils.isEmail(value!)) {
      return false;
    }

    return null;
  }
}
