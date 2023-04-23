import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:old_goose/DBHelper.dart';
import 'package:old_goose/services/GrailService.dart';
import 'package:old_goose/services/MailService.dart';
import 'e-commerce.dart';
import 'mont_saint_michel_traffic.dart';

Future<void> main() async {
  // Ticket APIs
  // var grailService = GrailService();
  // var searchResponse = await grailService.search("ST_D1297OY2", "ST_LV5236GZ", "2023-04-25", "15:00", 1, 0);
  // var bookingCode = searchResponse.data?[1].solutions?[0].sections?[0].offers?[0].services?[0].bookingCode; //TODO: choose booking code by GUI
  // var onlineOrderId = await grailService.booking(bookingCode!, 'kyoforing@gmail.com');
  // await grailService.confirm(onlineOrderId); //TODO:　confirm ticket when user paid
  // var tickets = await grailService.getTicket(onlineOrderId); //TODO:　about 5~10 minute, can query ticket information

  // DbHelper.insertUserData();
  Stripe.publishableKey = 'pk_test_51MzZGsAal8fGT9eQ7oCwc31CbDogCPNTyVSx8kAvxxfRumfHwm9bq0PEheuxRcfaumzVfcAc5iDVC6260FLzuXmI007ZwVzzw7';

  runApp(const MyApp());
  DbHelper.close();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await DbHelper.connect();
      await DbHelper.insertUserData();
    });
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(child: SimpleEcommerce()),
    )   );
  }

}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator HomeWidget - FRAME
    return

      Container(
          width: 402,
          height: 870,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Stack(children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 402,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(171, 182, 194, 1),
                    ))),
            const Positioned(
                top: 16,
                left: 14,
                child: Text(
                  'Old Goose',
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
                top: 102,
                left: 34,
                child: Container(
                    width: 334,
                    height: 107,
                    decoration: BoxDecoration(),
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: GestureDetector(
                            child: Container(
                                width: 334,
                                height: 107,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(5, 10, 48, 1),
                                )),
                            onTap: ()=>{
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TrafficWidget()))
                            },)),
                      Positioned(
                          top: 30,
                          left: 26,
                          child: GestureDetector(
                            child: Text(
                              '聖米歇爾套票',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 24,
                                  letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            onTap: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TrafficWidget()))
                            },
                          )),
                    ]))),
          ]
          )
      );

  }
}
