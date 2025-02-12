import 'package:flutter/material.dart';
import 'videoplayerwidget.dart';

class Cctv extends StatelessWidget {
    const Cctv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Cctv'),
      ),
      body: Center(
        child: VideoPlayerWidget(
          videoUrl: 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Cctv(),
  ));
}