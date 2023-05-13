import 'package:aya_project/feature/regex/regex_control.dart';

// Extension for String class for email, name and password validation, help us to use the Regex class easily
extension RegexControl on String {
  bool get isEmailValid => Regex().checkEmail(this);
  bool get isNameValid => Regex().checkName(this);
  bool get isPasswordValid => Regex().checkPassword(this);
}
