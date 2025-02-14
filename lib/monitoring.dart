import 'package:flutter/material.dart';

class monitoringpage extends StatefulWidget {
  const monitoringpage({super.key});

  @override
  _monitoringpageState createState() => _monitoringpageState();
}

class _monitoringpageState extends State<monitoringpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      appBar: AppBar(
        title: const Text(
          "Monitoring Jaringan",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 122, 185), 
        elevation: 5,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                '../temp_project/web/Nagvis.png', // Ensure the image is in assets folder & declared in pubspec.yaml
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1976D2), // Blue button
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Kembali",
                style: TextStyle(color: Colors.white), // White text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
