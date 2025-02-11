import 'package:flutter/material.dart';

class MonitoringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for temperature, date, and time
    String temperature = '25°C';
    String date = '2023-10-05';
    String time = '14:30';

    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring Suhu'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Suhu',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.thermostat, size: 40, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  'Suhu Saat Ini:',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              temperature, // This should be replaced with actual temperature data
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 40, color: Colors.green),
                SizedBox(width: 10),
                Text(
                  'Tanggal:',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              date,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.access_time, size: 40, color: Colors.orange),
                SizedBox(width: 10),
                Text(
                  'Waktu:',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              time,
              style: TextStyle(fontSize: 24),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali ke Menu'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}