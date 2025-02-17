import 'package:flutter/material.dart';

class laporanpage extends StatelessWidget {
  const laporanpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Laporan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 122, 185),
        foregroundColor: Colors.white,
        elevation: 5,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Data Suhu Harian',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 20,
                        headingRowColor: WidgetStateColor.resolveWith((states) => Colors.blue),
                        columns: const [
                          DataColumn(label: Text('Suhu', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                          DataColumn(label: Text('Hari', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                          DataColumn(label: Text('Tanggal', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                          DataColumn(label: Text('Jam', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                        ],
                        rows: const [
                          DataRow(cells: [
                            DataCell(Text('30°C')),
                            DataCell(Text('Senin')),
                            DataCell(Text('12-02-2024')),
                            DataCell(Text('14:30:20')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('29°C')),
                            DataCell(Text('Selasa')),
                            DataCell(Text('13-02-2024')),
                            DataCell(Text('15:00:20')),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Kembali ke Menu',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
