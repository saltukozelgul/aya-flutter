import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  // init method is used to initialize the shared preferences
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  // setString method is used to set the string value in shared preferences
  Future<void> setString(Enum key, String value) async {
    await preferences!.setString(key.name, value);
  }

  // setBool method is used to set the bool value in shared preferences
  Future<void> setBool(Enum key, bool value) async {
    await preferences!.setBool(key.name, value);
  }

  // getString method is used to get the string value from shared preferences
  String? getString(Enum key) {
    return preferences!.getString(key.name);
  }

  // getBool method is used to get the bool value from shared preferences
  bool? getBool(Enum key) {
    return preferences!.getBool(key.name);
  }
}
