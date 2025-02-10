import 'package:flutter/material.dart';

class monitoringpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring'),
        backgroundColor: Color.fromARGB(0, 244, 2, 2),
    ),
    body: Center(
      child: ElevatedButton(onPressed: (){
        Navigator.pop(context);
      },
      child: Text('Kemmbali ke menu'),
      ),
    ),
    ) ;
  }
}