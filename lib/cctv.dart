import 'package:flutter/material.dart';

class cctv extends StatelessWidget {
  const cctv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CCTV'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Kemmbali ke menu'),
        ),
      ),
    );
  }
}
