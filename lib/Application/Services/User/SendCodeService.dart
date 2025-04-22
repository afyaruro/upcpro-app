import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:upcpro_app/Infrastructure/Config/smtp/sendMailService.dart';

class SendCodeService {
  final SendEmailSmtp sendMail;

  SendCodeService({required this.sendMail});

  Future<bool> sendCodeVerification(String destinatario, String code) async {

    return await sendMail.sendMail(
      destinatario,
      await generateHtml(code),
      "Código de verificación",
    );
  }

  String generateCodeVerification() {
    var random = Random();
    return (random.nextInt(900000) + 100000).toString();
  }

  Future<String> generateHtml(String code) async {

    final ByteData imageData = await rootBundle.load('assets/upcpro.png');
    final Uint8List bytes = imageData.buffer.asUint8List();
    final String base64Image = base64Encode(bytes);

    return """
  <!DOCTYPE html>
  <html>
  <head>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
      }
      .container {
        width: 100%;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        margin: 40px auto;
        max-width: 600px;
        border-radius: 8px;
        text-align: center;
      }
      .header {
        background-color: #4caf50;
        color: white;
        padding: 10px;
        font-size: 24px;
        border-radius: 8px 8px 0 0;
      }
      .content {
        padding: 20px;
        font-size: 16px;
      }
      .code {
        font-size: 24px;
        font-weight: bold;
        background-color: #f4f4f4;
        padding: 10px;
        border-radius: 5px;
        color: #4caf50;
        display: inline-block;
        margin: 20px 0;
      }
      .footer {
        margin-top: 20px;
        font-size: 12px;
        color: #888888;
      }
      .img-container {
        width: 150px;
        height: 150px;
        background-color: #A1D0FF;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto 20px;
      }
      .img-container img {
        width: 80%;
        height: auto;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="header">¡Tu Código de Verificación!</div>
      <div class="content">
          <img src="data:image/png;base64,$base64Image" alt="Logo de la aplicación" style="width: 150px;">
        <p>Hola, gracias por utilizar upcpro. Tu código de verificación es el siguiente:</p>
        <div class="code">$code</div>
        <p>Por favor, introduce este código en la aplicación para continuar.</p>
        <p>Si no solicitaste este código, simplemente ignora este mensaje.</p>
      </div>
      <div class="footer">© 2025 upcpro - Todos los derechos reservados</div>
    </div>
  </body>
  </html>
  """;
  }
}
