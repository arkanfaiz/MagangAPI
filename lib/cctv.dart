import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Cctv extends StatelessWidget {
  const Cctv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard CCTV'),
      ),
      body: const WebView(
        initialUrl: 'https://lewatmana.com/cam/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Cctv(),
  ));
}
