import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

class Cctv extends StatefulWidget {
  const Cctv({super.key});

  @override
  State<Cctv> createState() => _CctvState();
}

class _CctvState extends State<Cctv> {
  final _controller = WebviewController();

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  Future<void> _initializeWebView() async {
    await _controller.initialize();
    await _controller.loadUrl('https://media.lewatmana.com/cam/lintek/192/videoclip20250212_112855.384.mp4');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard CCTV'),
      ),
      body: _controller.value.isInitialized
          ? Webview(_controller)
          : Center(child: CircularProgressIndicator()),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Cctv(),
  ));
}