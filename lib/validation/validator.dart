import 'package:email_validator/email_validator.dart';
import 'package:intl/intl.dart';

class Validator {
  static bool validateEmail(String? input) {
    if (input != null) {
      return EmailValidator.validate(input, true, true);
    }
    return false;
  }

  static bool validateName(String? input) {
    if (input != null && input.length > 3) {
      return !RegExp(r"[`~!@#\$%^&*()-_=+[{]}\|;:'" ",<.>/?]").hasMatch(input);
    }
    return false;
  }

  static bool validatePassword(String? input) {
    if (input != null) {
      return input.length >= 7;
    }
    return false;
  }

  static bool validatePortPassID(String? input) {
    if (input != null) {
      return input.length == 11;
    }
    return false;
  }

  static bool validatePortPassExpiry(String? input) {
    if (input != null && input.length == 8) {
      final duration =
          DateFormat('dd/MM/yy').parse(input).difference(DateTime.now());
      return duration.inDays >= 1;
    }
    return false;
  }
}
