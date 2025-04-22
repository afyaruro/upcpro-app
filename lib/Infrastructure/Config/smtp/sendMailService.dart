import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';

class SendEmailSmtp {
  SendEmailSmtp();

  Future<bool> sendMail(
    String destinatario,
    String htmlMessage,
    String subject,
  ) async {
    final smtpServer = gmail(mailSmtp, appPassword);

    final message =
        Message()
          ..from = const Address(mailSmtp, 'upcpro')
          ..recipients.add(destinatario)
          ..subject = subject
          ..html = htmlMessage;

    try {
      await send(message, smtpServer);
      return true;
    } on MailerException catch (e) {
      print("error: $e");
      return false;
    }
  }
}
