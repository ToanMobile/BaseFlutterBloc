import 'package:base_flutter_bloc/app/config/extensions/string_extension.dart';
import 'package:dartx/dartx.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.isPure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    if (value.isNullOrEmpty) {
      return EmailValidationError.empty;
    }
    if (!value.isEmail()) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}
