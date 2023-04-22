import 'package:flutter/material.dart';
import 'package:old_goose/main_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
          body: SafeArea(child: HomeWidget()),
        ));
  }
}

// class MyWebView extends StatefulWidget {
//   const MyWebView({super.key});
//
//   @override
//   State<MyWebView> createState() => _MyWebViewState();
// }
//
// class _MyWebViewState extends State<MyWebView> {
//   late final WebViewController controller;
//   double height = 0;
//   @override
//   void initState() {
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSdoexrmDSlFzOeXWAm_Sdf1I51pZxkGdA1KLc4XT0WpBUOgOQ/viewform'));
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [Expanded(child: WebViewWidget(controller: controller))],
//     );
//   }
// }


class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator HomeWidget - FRAME
    return Container(
        width: 402,
        height: 870,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 402,
                      height: 60,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(171, 182, 194, 1),
                      )
                  )
              ),Positioned(
                  top: 16,
                  left: 14,
                  child: Text('Old Goose', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Inter',
                      fontSize: 30,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 102,
                  left: 34,
                  child: Container(
                      width: 334,
                      height: 107,
                      decoration: BoxDecoration(

                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 334,
                                    height: 107,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color : Color.fromRGBO(5, 10, 48, 1),
                                    )
                                )
                            ),Positioned(
                                top: 30,
                                left: 26,
                                child: Text('Mont-Saint-Michel Traffic', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 24,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 241,
                  left: 34,
                  child: Container(
                      width: 334,
                      height: 107,
                      decoration: BoxDecoration(

                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 334,
                                    height: 107,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color : Color.fromRGBO(5, 10, 48, 1),
                                    )
                                )
                            ),Positioned(
                                top: 30,
                                left: 26,
                                child: Text('Mont-Saint-Michel Ticket', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 24,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),
                          ]
                      )
                  )
              ),
            ]
        )
    );
  }
}
