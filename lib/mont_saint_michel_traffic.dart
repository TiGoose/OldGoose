import 'package:flutter/material.dart';
import 'package:old_goose/payment.dart';


class TrafficWidget extends StatefulWidget {
  @override
  _TrafficWidgetState createState() => _TrafficWidgetState();
}

class _TrafficWidgetState extends State<TrafficWidget> {
  String _inputText = '';

  void _updateInputText(String text) {
    setState(() {
      _inputText = text;
    });
  }

  get child => null;

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator TrafficWidget - FRAME

    return Container(
        width: 402,
        height: 870,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,

              child: Container(
                width: 402,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(171, 182, 194, 1),
                ),
                child: Text('聖米歇爾山套票~~~~',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 24,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1)),
              )),
          const Positioned(
              top: 72,
              left: 25,
              child: Text(
                '請選擇您的組合',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.5),
              )),
          Positioned(
            top: 100,
            left: 25,
            child: ElevatedButton(
              onPressed: () {
                // tryPayment('a');
              },
              child: const Text('大人組合 a : +上午票'),
            ),
          ),
          Positioned(
            top: 150,
            left: 25,
            child: ElevatedButton(
              onPressed: () {
                // tryPayment('b');
              },
              child: const Text('大人組合 b : +上午票'),
            ),
          ),

          // Positioned(
          //     top: 653,
          //     left: 29,
          //     child: Container(
          //         width: 334,
          //         height: 57,
          //         decoration: const BoxDecoration(),
          //         child: Stack(children: <Widget>[
          //           Positioned(
          //             top: 0,
          //             left: 0,
          //             child: GestureDetector(
          //               onTap: () {
          //                 tryPayment('any');
          //               },
          //               child: Container(
          //                 width: 334,
          //                 height: 57,
          //                 decoration: const BoxDecoration(
          //                   borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(5),
          //                     topRight: Radius.circular(5),
          //                     bottomLeft: Radius.circular(5),
          //                     bottomRight: Radius.circular(5),
          //                   ),
          //                   color: Color.fromRGBO(5, 10, 48, 1),
          //                 ),
          //               ),
          //             ),
          //           ),

                    // const Positioned(
                    //   top: 15,
                    //   left: 26,
                    //   child: Text(
                    //     '立即訂購',
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //       color: Color.fromRGBO(255, 255, 255, 1),
                    //       fontFamily: 'Inter',
                    //       fontSize: 24,
                    //       letterSpacing: 0,
                    //       fontWeight: FontWeight.normal,
                    //       height: 1,
                    //     ),
                    //   ),
                    // ),


                  ]));
        // ]));
  }

  // void tryPayment(String s) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentWidget())) ;
  // }
}
