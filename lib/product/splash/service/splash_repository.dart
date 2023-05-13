import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:aya_project/core/constants/service_constant/api_path_extensions.dart';
import 'package:aya_project/core/database/shared_manager.dart';
import 'package:http/http.dart' as http;
import 'package:aya_project/core/enums/global_enums.dart';
import 'package:aya_project/core/service/global_service_functions.dart';

// repository for splash screen -> network sheet
abstract class SplashRepository {
  Future<bool> checkUserLoggedIn();
}

// repository implementation for splash screen -> network sheet
class SplashRepositoryImpl implements SplashRepository {
  // check user logged in or not
  @override
  Future<bool> checkUserLoggedIn() async {
    SharedManager sharedManager = SharedManager();
    await sharedManager.init();
    return sharedManager.getBool(AuthenticateInfo.isLogin) ?? false;
  }
}
