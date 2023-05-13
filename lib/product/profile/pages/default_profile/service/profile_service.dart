import '../../../../../core/database/shared_manager.dart';
import '../../../../../core/enums/global_enums.dart';

abstract class ProfileService {
  Future<void> logout();
}

class ProfileServiceImpl extends ProfileService {
  @override
  Future<void> logout() async {
    SharedManager sharedManager = SharedManager();
    await sharedManager.init();

    await sharedManager.setString(AuthenticateInfo.username, '');
    await sharedManager.setString(AuthenticateInfo.password, '');
    await sharedManager.setBool(AuthenticateInfo.isLogin, false);
  }
}
