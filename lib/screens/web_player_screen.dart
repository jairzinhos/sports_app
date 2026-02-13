import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPlayerScreen extends StatefulWidget {
  final String url;

  const WebPlayerScreen({super.key, required this.url});

  @override
  State<WebPlayerScreen> createState() => _WebPlayerScreenState();
}

class _WebPlayerScreenState extends State<WebPlayerScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reproduciendo')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
