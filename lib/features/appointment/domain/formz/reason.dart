import 'package:formz/formz.dart';
import 'package:moli_shared/moli_shared.dart';

class Reason extends FormzInput<String?, bool> {
  const Reason.pure([super.value]) : super.pure();
  const Reason.dirty(super.value) : super.dirty();

  @override
  bool? validator(String? value) {
    if (StringUtils.isNullOrBlank(value) || value!.length > 256) {
      return false;
    }
    return null;
  }
}
