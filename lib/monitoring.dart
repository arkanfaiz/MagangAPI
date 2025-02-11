import 'package:flutter/material.dart';
import 'dart:async';

class MonitoringPage extends StatefulWidget {
  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  double _temperature = 0.0;
  String _dateTime = '';

  @override
  void initState() {
    super.initState();
    _updateTemperature();
    _updateDateTime();
    Timer.periodic(Duration(minutes: 1), (Timer t) {
      _updateTemperature();
    });
  }

  void _updateTemperature() {
    // Simulate fetching temperature data
    setState(() {
      _temperature = 25.0; // Replace with actual temperature fetching logic
    });
  }

  void _updateDateTime() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _dateTime = DateTime.now().toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring Suhu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Suhu: $_temperature °C',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Tanggal dan Waktu: $_dateTime',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Kembali ke Menu"),
            ),
          ],
        ),
      ),
    );
  }
}