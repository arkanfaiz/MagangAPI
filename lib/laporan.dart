import 'package:flutter/material.dart';

class laporanpage extends StatelessWidget {
  const laporanpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan'),
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
