import 'dart:math';

class CodeGenerator {
  String generateCode() {
    String randomCode = '';
    Random random = Random.secure();

    for (int i = 0; i < 4; i++) {
      randomCode += random.nextInt(9).toString();
    }

    return randomCode;
  }
}
