import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class MailService {
  String address;

  MailService(this.address);

  Future<void> sendBookingMail(String onlineOrderId, int adultCount, int childCount) async {
    const title = "謝謝您的購買，我們確認款項後將盡速為您出票 - 老天鵝團隊";
    var content = "親愛的客戶：<br><br>感謝您的購買，我們已收到您的訂單<br><br>"
        "訂單編號：$onlineOrderId<br>"
        "大人：$adultCount<br>"
        "小孩：$childCount<br><br>"
        "我們確認款項後將盡速為您出票，謝謝您的耐心等候<br><br>"
        "如果您有任何問題或需要進一步協助，歡迎聯繫 valorelove@gmail.com <br><br>"
        "老天鵝團隊";
    sendMail(title, content);
  }

  Future<void> sendTicketMail(String ticketUrl) async {
    const title = "謝謝您的購買，請至郵件確認您的購買憑證 - 老天鵝團隊";
    var content = "親愛的客戶：<br><br>非常感謝您的購買。請查看以下連結以獲取購買憑證。"
        "<br><br>$ticketUrl<br><br>"
        "如果您有任何問題或需要進一步協助，歡迎聯繫 valorelove@gmail.com<br>"
        "再次感謝您的購買，期待在未來繼續為您提供優質的服務，謝謝。<br><br>"
        "老天鵝團隊";
    sendMail(title, content);
  }

  Future<void> sendMail(String title, String content) async {
    String username = 'kyoforing@gmail.com'; // 您的電子郵件地址
    String password = 'nhxswhcvlwjcvxlw'; // 您的電子郵件密碼

    final smtpServer = gmail(username, password); // 用於Gmail的SMTP服務器
    final message = Message()
      ..from = Address(username, '老天鵝') // 您的姓名和電子郵件地址
      ..recipients.add(address) // 收件人的電子郵件地址
      ..subject = title // 郵件主題
      ..html = content; // 郵件正文的HTML部分

    try {
      final sendReport = await send(message, smtpServer);
    } on MailerException catch (e) {
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}