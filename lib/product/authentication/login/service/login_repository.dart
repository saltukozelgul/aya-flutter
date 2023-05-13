import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:aya_project/core/constants/service_constant/api_error_texts.dart';
import 'package:aya_project/core/database/shared_manager.dart';
import 'package:aya_project/core/enums/global_enums.dart';
import 'package:aya_project/core/service/global_service_functions.dart';
import '../../../../core/constants/service_constant/api_path_extensions.dart';

abstract class LoginRepository {
  //Future<UserModel?> login(String username, String password);
  Future<void> initToSharedPreferences(String username, String password);
}

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<void> initToSharedPreferences(String username, String password) async {
    SharedManager sharedManager = SharedManager();
    await sharedManager.init();

    await sharedManager.setString(AuthenticateInfo.username, username);
    await sharedManager.setString(AuthenticateInfo.password, password);
    await sharedManager.setBool(AuthenticateInfo.isLogin, true);
  }
}
