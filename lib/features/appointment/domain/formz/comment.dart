import 'package:formz/formz.dart';

enum CommentValidationError { invalid }

class Comment extends FormzInput<String, CommentValidationError> {
  const Comment.pure([super.value = '']) : super.pure();
  const Comment.dirty([super.value = '']) : super.dirty();

  /* static final RegExp _CommentRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'); */

  @override
  CommentValidationError? validator(String? value) {
    if (value != null) {
      return null;
    } else {
      return CommentValidationError.invalid;
    }
    // return _CommentRegex.hasMatch(value!)
    //     ? null
    //     : CommentValidationError.invalid;
  }
}
