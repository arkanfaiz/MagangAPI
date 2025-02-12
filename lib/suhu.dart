import 'package:flutter/material.dart';
import 'dart:async';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';

class suhupage extends StatefulWidget {
  const suhupage({super.key});

  @override
  _SuhuPageState createState() => _SuhuPageState();
}

class _SuhuPageState extends State<suhupage> {
  double _temperature = 0.0;
  String _day = '';
  String _date = '';
  String _time = '';
  Timer? _temperatureTimer;
  Timer? _dateTimeTimer;

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
  AndroidBatteryInfo? batteryInfo = await BatteryInfoPlugin().androidBatteryInfo;
  setState(() {
    _temperature = (batteryInfo?.temperature ?? 0) / 10; // Convert from deci-Celsius
  });
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
      title: Text(
        'Monitoring Suhu Server AOCC',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
      elevation: 0,
    ),
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9, // Adjust container width
          height: MediaQuery.of(context).size.height * 0.7, // Adjust container height
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
                  fontSize: 100, // Bigger temperature font size
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
