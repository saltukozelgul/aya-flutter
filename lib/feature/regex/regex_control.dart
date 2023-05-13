// Regex class for checking the email, name, password, nickname, etc. in the project
class Regex {
  bool checkEmail(String email) {
    RegExp regExp = RegExp(_RegexPatterns().emailPattern);
    return regExp.hasMatch(email);
  }

  bool checkName(String name) {
    RegExp regExp = RegExp(_RegexPatterns().namePattern);
    return regExp.hasMatch(name);
  }

  bool checkPassword(String password) {
    RegExp regExp = RegExp(_RegexPatterns().passwordPattern);
    return regExp.hasMatch(password);
  }
}

// Regex patterns while using in the project as a constant class for Regex class
class _RegexPatterns {
  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final String namePattern = r"^(?=.{1,40}$)[a-zA-Z]+(?:[-'\s][a-zA-Z]+)*$";

  final String passwordPattern = r'^(?=.*[0-9])(?=.*[a-zA])[a-zA-Z0-9!@#$%(^)&*+_~`=-]{8,21}$';

  final String nickNamePattern = r'^[A-Za-z][A-Za-z0-9_]{7,29}$';
}
