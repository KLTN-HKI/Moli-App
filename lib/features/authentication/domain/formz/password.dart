import 'package:formz/formz.dart';
import 'package:moli_app/shared/shared.dart';

class Password extends FormzInput<String, bool> {
  const Password.pure([super.value = '']) : super.pure();
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  bool? validator(String? value) {
    if (StringUtils.isNullOrBlank(value) || (value!.length < 6)) {
      return false;
    }

    return null;
  }
}
