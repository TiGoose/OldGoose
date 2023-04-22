import 'package:flutter/material.dart';
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
          body: SafeArea(child: MyWebView()),
        ));
  }
}

class MyWebView extends StatefulWidget {
  const MyWebView({super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late final WebViewController controller;
  double height = 0;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSdoexrmDSlFzOeXWAm_Sdf1I51pZxkGdA1KLc4XT0WpBUOgOQ/viewform'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(child: WebViewWidget(controller: controller))],
    );
  }
}
