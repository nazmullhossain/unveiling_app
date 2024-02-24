// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// import 'package:webview_flutter/webview_flutter.dart';
//
//
//
//
// class WebViewApp extends StatefulWidget {
//   const WebViewApp({super.key});
//
//   @override
//   State<WebViewApp> createState() => _WebViewAppState();
// }
//
// class _WebViewAppState extends State<WebViewApp> {
//   late final WebViewController controller;
//
//   @override
//   void initState() {
//     controller = WebViewController()
//       ..loadRequest(Uri.parse('https://flutter.dev'));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter WebView'),
//       ),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }