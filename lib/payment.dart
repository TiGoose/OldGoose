import 'package:flutter/material.dart';

class PaymentWidget extends StatefulWidget {
  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator PaymentWidget - FRAME

    return Container(
        width: 402,
        height: 870,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 402,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(171, 182, 194, 1),
                  ))),
          Positioned(
              top: 16,
              left: 14,
              child: Text(
                '支付',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 30,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 131,
              left: 45,
              child: Container(
                  width: 311,
                  height: 346,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/qrcode.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 515,
              left: 90,
              child: Text(
                '1182979108641 玉山銀行 808',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 30,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 96,
              left: 84,
              child: Text(
                '新台幣：2,040',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 30,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
        ]));
  }
}
