import 'package:flutter/material.dart';
import 'package:tubes_alpro/data.dart'; // Pastikan file data.dart sudah ada di folder lib/

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hitung total pengeluaran per kategori
    Map<String, int> categoryTotals = {
      'Akomodasi': 0,
      'Makanan': 0,
      'Transportasi': 0,
      'Hiburan': 0,
    };

    for (var item in spEnding) {
      if (item != null && item.tipe != null && item.amount != null) {
        if (categoryTotals.containsKey(item.tipe)) {
          categoryTotals[item.tipe!] =
              categoryTotals[item.tipe!]! + item.amount!;
        }
      }
    }

    // Buat data untuk chart
    List<Map<String, dynamic>> data = categoryTotals.entries.map((entry) {
      return {
        'domain': entry.key,
        'measure': entry.value,
      };
    }).toList();

    // Hitung measureMax
    int measureMax = 100000;
    if (budGet.Budget > 10000000) {
      measureMax = 10000000;
    } else if (budGet.Budget > 1000000) {
      measureMax = 1000000;
    } else if (budGet.Budget > 100000) {
      measureMax = 100000;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Chart', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Chart
              SizedBox(
                height: 300,
                width: 350,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(350, 300),
                      painter: BarChartPainter(data, measureMax),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Kotak kuning
              Container(
                width: 350,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(202, 176, 255, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Keterangan:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ...data.map((e) {
                      return Text(
                        '${e['domain']}: Rp ${e['measure']}',
                        style: const TextStyle(fontSize: 14),
                      );
                    }).toList(),
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

class BarChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;
  final int max;

  BarChartPainter(this.data, this.max);

  @override
  void paint(Canvas canvas, Size size) {
    double barWidth = size.width / (data.length * 2);
    double maxHeight = size.height - 40; // Kasih padding bawah dan atas

    Paint axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    Map<String, Color> colorMap = {
      'Akomodasi': const Color.fromARGB(255, 15, 4, 129),
      'Makanan': const Color.fromARGB(255, 8, 88, 112),
      'Transportasi': const Color.fromARGB(255, 182, 15, 140),
      'Hiburan': const Color.fromARGB(255, 190, 160, 231),
    };

    // Cari data terbesar (measure)
    double maxMeasure = data.isNotEmpty
        ? data.map((e) => e['measure'].toDouble()).reduce((a, b) => a > b ? a : b)
        : 1;

    // Tambahkan margin atas dan bawah
    double topMargin = 20;

    // Gambar sumbu X
    canvas.drawLine(
      Offset(0, maxHeight + topMargin),
      Offset(size.width, maxHeight + topMargin),
      axisPaint,
    );

    for (int i = 0; i < data.length; i++) {
      String domain = data[i]['domain'];
      double measure = data[i]['measure'].toDouble();

      // Skala dinamis berdasarkan maxMeasure
      double barHeight = (measure / maxMeasure) * (maxHeight - topMargin);
      double x = i * barWidth * 2 + barWidth / 2;
      double y = (maxHeight + topMargin) - barHeight;

      Paint barPaint = Paint()..color = colorMap[domain] ?? Colors.grey;

      // Gambar batang
      canvas.drawRect(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        barPaint,
      );

      // Label angka
      TextSpan span = TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 10),
        text: measure.toStringAsFixed(0),
      );
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(x, y - 15));

      // Label domain
      TextSpan domainSpan = TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 10),
        text: domain,
      );
      TextPainter domainTp = TextPainter(
        text: domainSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      domainTp.layout();
      domainTp.paint(canvas, Offset(x, maxHeight + topMargin + 4));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
