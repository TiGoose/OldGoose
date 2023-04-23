
import 'package:flutter/material.dart';

import 'e-commerce.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key, required this.orderId, required this.email, required this.amount});
  final String orderId;
  final String email;
  final int amount;

  @override
  PaymentWidgetState createState() => PaymentWidgetState();
}

class PaymentWidgetState extends State<PaymentWidget> {
  int get amount => widget.amount;
  String get orderId => widget.orderId;
  String get email => widget.email;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('付款取得以保留您的訂單'),
        actions: const [
          LiveChatBarAction(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child:
                  Image.asset(
                    'assets/images/usdt.png',
                    width: 200,
                    height: 200,
                  ),
              ),
              SizedBox(height: 20),
              Text('訂單編號：$orderId',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                  '總金額： USDT \$' + (amount / 31).toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Text('地址：TQjVwofuGBGc21SFF2sywf8bkXtYpY8znt',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text('訂單將保留 30 分鐘，請於時限內付款，票券將會寄到您提供的 Email - ' + email + ' !' ,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text('感謝您的訂購，期待能繼續服務您~' ,
                style: TextStyle(fontSize: 24,
                  color: Colors.red,),
              ),
            ]
        ),
      )
    );
  }
}

class StatusWidget extends StatefulWidget {
  const StatusWidget({super.key});

  @override
  StatusWidgetState createState() => StatusWidgetState();
}

class StatusWidgetState extends State<StatusWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('交易狀態'),
          actions: const [
            LiveChatBarAction(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Center(
                  child:
                  Image.asset(
                    'assets/images/loading.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(height: 20),
                Text('感謝您使用老天鵝平台訂購票券！' ,
                  style: TextStyle(fontSize: 24,
                    color: Colors.red,),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  child: Text('票券將會於您付款後約 1 小時內寄到您的 Email ，若逾時仍未收到票券，可點擊右上角聯繫 live chat，將由專人為您服務。' ,
                    style: TextStyle(fontSize: 20,
                      color: Colors.blueAccent,),
                  ),
                ),

              ]
          ),
        )
    );
  }
}
