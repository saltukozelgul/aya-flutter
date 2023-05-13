import 'package:aya_project/core/extension/regex_extensions.dart';
import 'package:aya_project/feature/badwords/badwords.dart';

class Validator {
  Future<String?> validateEmail(String? value) async {
    if (value == null || value.isEmpty) {
      return 'Email boş bırakılamaz';
    }
    if (!value.isEmailValid || await BadwordFilter().isWordUnvalid(value)) {
      return 'Geçerli bir email giriniz';
    }
    return null;
  }

  // todo username regex'i yanlis calisiyor
  Future<String?> validateUsername(String? value) async {
    if (value == null || value.isEmpty) {
      return 'İsim boş bırakılamaz';
    }
    if (!value.isNameValid || await BadwordFilter().isWordUnvalid(value)) {
      return 'Geçerli bir isim giriniz';
    }
    return null;
  }

  Future<String?> validatePassword(String? value) async {
    if (value == null || value.isEmpty) {
      return 'Şifre boş bırakılamaz';
    }
    if (!value.isPasswordValid || await BadwordFilter().isWordUnvalid(value)) {
      return 'Şifre en az 8 karakterden oluşmalıdır'; // todo change this
    }
    return null;
  }

  Future<String?> badwordFilterWord(String? value) async {
    if (value == null || value.isEmpty) {
      return 'Boş bırakılamaz';
    }
    if (await BadwordFilter().isWordUnvalid(value)) {
      return 'Bu kelime kullanılamaz';
    }
    return null;
  }

  Future<String?> badwordFilterSentence(String? value) async {
    if (await BadwordFilter().isSentenceUnvalid(value ?? '')) {
      return 'Bu cümle kullanılamaz';
    }
    return null;
  }
}
