import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFE6E6FA),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            'Chart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: false,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: DChartBarO(
                groupList: [
                  OrdinalGroup(
                    id: 'Kategori',
                    data: [
                      OrdinalData(domain: 'Akomodasi', measure: 13),
                      OrdinalData(domain: 'Makanan', measure: 13),
                      OrdinalData(domain: 'Transportasi', measure: 9),
                      OrdinalData(domain: 'Hiburan', measure: 5),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
