import 'package:flutter/material.dart';
import 'dart:async';

class suhupage extends StatefulWidget {
  @override
  _SuhuPageState createState() => _SuhuPageState();
}

class _SuhuPageState extends State<suhupage> {
  double _temperature = 0.0;
  String _dateTime = '';
  Timer? _temperatureTimer;
  Timer? _dateTimeTimer;

  @override
  void initState() {
    super.initState();
    _updateTemperature();
    _updateDateTime();

    // Update suhu setiap 10 detik
    _temperatureTimer = Timer.periodic(Duration(seconds: 10), (Timer t) {
      _updateTemperature();
    });

    // Update waktu setiap detik
    _dateTimeTimer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      _updateDateTime();
    });
  }

  @override
  void dispose() {
    // Hentikan timer saat widget dihapus
    _temperatureTimer?.cancel();
    _dateTimeTimer?.cancel();
    super.dispose();
  }

  void _updateTemperature() {
    setState(() {
      // Simulasi pengambilan data suhu
      _temperature = 25.0 + (5 * (DateTime.now().second % 2));
    });
  }

  void _updateDateTime() {
    setState(() {
      _dateTime = DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring Suhu Gedung AOCC'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.blue.shade100, // Warna latar belakang lebih soft
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
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Tanggal & Waktu:\n$_dateTime',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
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
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
