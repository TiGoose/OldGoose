import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:old_goose/DBHelper.dart';
import 'e-commerce.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Ticket APIs
  // var grailService = GrailService();
  // var searchResponse = await grailService.search("ST_D1297OY2", "ST_LV5236GZ", "2023-04-25", "15:00", 1, 0);
  // var bookingCode = searchResponse.data?[1].solutions?[0].sections?[0].offers?[0].services?[0].bookingCode; //TODO: choose booking code by GUI
  // var onlineOrderId = await grailService.booking(bookingCode!, 'kyoforing@gmail.com');
  // await grailService.confirm(onlineOrderId); //TODO:　confirm ticket when user paid
  // var tickets = await grailService.getTicket(onlineOrderId); //TODO:　about 5~10 minute, can query ticket information

  // DbHelper.insertUserData();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

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

