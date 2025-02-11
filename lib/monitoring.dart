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
    Timer.periodic(Duration(seconds: 10), (Timer t) {
      _updateTemperature();
    });
  }

  void _updateTemperature() {
    // Simulate fetching temperature data
    setState(() {
      _temperature = 25.0 + (5 * (DateTime.now().second % 2)); // Replace with actual temperature fetching logic
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
        title: Text('Monitoring Suhu Gedung AOCC'),
      ),
      body: Container(
        color: Colors.blue, // Set background color to blue
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Suhu: $_temperature °C',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Tanggal dan Waktu: $_dateTime',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
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
      ),
    );
  }
}