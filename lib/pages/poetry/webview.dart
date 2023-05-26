import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PoetryWebview extends StatefulWidget {
  const PoetryWebview({super.key});

  @override
  State<PoetryWebview> createState() => _PoetryState();
}

class _PoetryState extends State<PoetryWebview> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('http://gaokao.101.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
