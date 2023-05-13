// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:aya_project/core/service/global_service_functions.dart';
import 'package:aya_project/product/authentication/signup/model/name_avatar_model.dart';
import 'package:http/http.dart' as http;

abstract class SignupRepository {
  Future<bool> signup(NameAvatarModel model, String mail, String password);
  Future<bool> isUserExists(String username);
  Future<bool> isEmailTaken(String email);
}

class SignupRepositoryImpl extends SignupRepository {
  // adds user to database
  @override
  Future<bool> signup(NameAvatarModel model, String mail, String password) async {
    String? mainPath = dotenv.env['API-MAIN-PATH'];
    String correctResult = '"The user has been created"';
    String register = 'register/';

    if (mainPath == null) {
      throw Exception('API-MAIN-PATH is not defined in .env file');
    } else {
      Uri url = Uri.parse('$mainPath$register');

      var response = await http.post(url, body: {
        "username": model.username.trim(),
        "email": mail.trim(),
        "password1": password.trim(),
        "password2": password.trim(),
        "avatar_id": model.avatarPath.split('_')[1][0],
        "csrfmiddlewaretoken": "",
      });

      if (GlobalServiceFunctions().responseCode200(response) && response.body == correctResult) {
        return true;
      } else {
        return false;
      }
    }
  }

  // checks that user exists in database
  @override
  Future<bool> isUserExists(String username) async {
    String? mainPath = dotenv.env['API-MAIN-PATH'];
    String isUserExists = 'isExists/username';

    Uri url = Uri.parse('$mainPath$isUserExists');

    final response = await http.post(url, body: {
      "username": username,
    });

    if (GlobalServiceFunctions().responseCode200(response) && response.body == 'true') {
      return true;
    } else {
      return false;
    }
  }

  // checks that email exists in database
  @override
  Future<bool> isEmailTaken(String email) async {
    String? mainPath = dotenv.env['API-MAIN-PATH'];
    String isEmailTaken = 'isExists/email';

    Uri url = Uri.parse('$mainPath$isEmailTaken');

    final response = await http.post(url, body: {
      "email": email,
    });

    if (GlobalServiceFunctions().responseCode200(response) && response.body == 'true') {
      return true;
    } else {
      return false;
    }
  }
}
