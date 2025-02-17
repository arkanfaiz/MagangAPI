import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class suhupage extends StatefulWidget {
  const suhupage({super.key});

  @override
  _suhupageState createState() => _suhupageState();
}

class _suhupageState extends State<suhupage> {
  double _temperature = 0.0;
  String _day = '';
  String _date = '';
  String _time = '';
  Timer? _temperatureTimer;
  Timer? _dateTimeTimer;
  final String arduinoUrl = 'http://your-arduino-ip/temp'; // Change to your Arduino IP

  @override
  void initState() {
    super.initState();
    _updateTemperature();
    _updateDateTime();

    _temperatureTimer = Timer.periodic(Duration(seconds: 10), (Timer t) {
      _updateTemperature();
    });

    _dateTimeTimer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      _updateDateTime();
    });
  }

  @override
  void dispose() {
    _temperatureTimer?.cancel();
    _dateTimeTimer?.cancel();
    super.dispose();
  }

  void _updateTemperature() async {
    try {
      final response = await http.get(Uri.parse(arduinoUrl));
      if (response.statusCode == 200) {
        setState(() {
          _temperature = double.parse(response.body);
        });
      }
    } catch (e) {
      print("Error fetching temperature: $e");
    }
  }

  void _updateDateTime() {
    final now = DateTime.now();
    List<String> days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
    setState(() {
      _day = days[now.weekday % 7];
      _date = "${now.day}-${now.month}-${now.year}";
      _time = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Monitoring Suhu Server",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 122, 185),
        foregroundColor: Colors.white,
        elevation: 5,
      ),
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_temperature°C',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 30),
              Text(
                _day,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                _date,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              Text(
                _time,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  shadowColor: Colors.blueAccent.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Kembali",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
