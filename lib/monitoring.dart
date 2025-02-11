import 'package:flutter/material.dart';

class monitoringpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suhu'),
    ),
    body: Center(
      child: ElevatedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text("kembali ke menu"),
     ),
    ),
    );
  }
}