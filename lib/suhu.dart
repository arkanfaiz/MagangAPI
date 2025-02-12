import 'package:flutter/material.dart';
import 'dart:async';

class SuhuPage extends StatefulWidget {
  @override
  _SuhuPageState createState() => _SuhuPageState();
}

class _SuhuPageState extends State<SuhuPage> {
  final StreamController<double> _temperatureController = StreamController<double>();
  final StreamController<String> _dateTimeController = StreamController<String>();

  @override
  void initState() {
    super.initState();
    _updateTemperature();
    _updateDateTime();

    // Update suhu setiap 10 detik
    Timer.periodic(Duration(seconds: 10), (Timer t) {
      _updateTemperature();
    });

    // Update waktu setiap detik
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      _updateDateTime();
    });
  }

  @override
  void dispose() {
    // Hentikan stream saat widget dihapus
    _temperatureController.close();
    _dateTimeController.close();
    super.dispose();
  }

  void _updateTemperature() {
    // Simulasi pengambilan data suhu
    double temperature = 25.0 + (5 * (DateTime.now().second % 2));
    _temperatureController.add(temperature);
  }

  void _updateDateTime() {
    String dateTime = DateTime.now().toString();
    _dateTimeController.add(dateTime);
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
              StreamBuilder<double>(
                stream: _temperatureController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
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
                            'Suhu: ${snapshot.data} °C',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          StreamBuilder<String>(
                            stream: _dateTimeController.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  'Tanggal & Waktu:\n${snapshot.data}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18, color: Colors.black54),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
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
