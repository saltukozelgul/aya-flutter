import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:aya_project/feature/mail/mail_html.dart';

import '../../../../core/service/global_service_functions.dart';
import 'package:http/http.dart' as http;

abstract class ForgotPasswordRepository {
  Future<bool> checkEmailExists(String email);
  Future<bool> sendMail(String mail, String code);
  Future<bool> changePassword(String mail, String password);
}

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  // check if the email exists in the database and returns true if it does
  @override
  Future<bool> checkEmailExists(String email) async {
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

  // sends the mail to the user with the code to reset the password and returns true if it is successful
  @override
  Future<bool> sendMail(String mail, String code) async {
    String? mailAddress = dotenv.env['MAIL-ADDRESS'];
    String? mailPassword = dotenv.env['MAIL-PASSWORD'];

    if (mailAddress == null || mailPassword == null) {
      return false;
    } else {
      final smtpServer = gmail(mailAddress, mailPassword);

      final message = Message();
      message.from = Address(mailAddress);
      message.recipients.add(mail);
      message.subject = "Moviote - Şifre Sıfırlama İsteği";
      message.html = MailHtml().htmlPartOne + code + MailHtml().htmlPartTwo;

      try {
        await send(message, smtpServer);
        return true;
      } on MailerException {
        return false;
      }
    }
  }

  // changes the password of the user and returns true if it is successful
  @override
  Future<bool> changePassword(String mail, String password) async {
    String? mainPath = dotenv.env['API-MAIN-PATH'];
    String changePassword = 'resetPassword';
    String okeyText = '"Password changed"';

    Uri url = Uri.parse('$mainPath$changePassword');

    final response = await http.post(url, body: {
      "email": mail,
      "newPassword": password,
    });

    if (GlobalServiceFunctions().responseCode200(response) && response.body == okeyText) {
      return true;
    } else {
      return false;
    }
  }
}
