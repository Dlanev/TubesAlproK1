import 'package:flutter/material.dart';
import 'package:tubes_alpro/data.dart';

class History extends StatefulWidget {
  @override
  _histState createState() => _histState();
}

class _histState extends State<History> {
  List<spend?> filteredSpending = [];
  @override
  void initState() {
    super.initState();
    filteredSpending = List.from(spEnding);
  }

  Widget buildSpendingHistory() {
    final nonNullSpending =
        filteredSpending.where((spend) => spend != null).toList();

    if (nonNullSpending.isEmpty) {
      return const Center(child: Text("Tidak Ada Riwayat Pengeluaran"));
    }

    return ListView.builder(
      itemCount: nonNullSpending.length,
      itemBuilder: (context, index) {
        final spend = nonNullSpending[index]!;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(spend.tipe ?? 'No type'),
            subtitle: Text(
              spend.waktu != null
                  ? '${spend.waktu!.day}/${spend.waktu!.month}/${spend.waktu!.year}'
                  : 'No date',
            ),
            trailing: Text(
              spend.amount != null ? 'Rp ${spend.amount}' : 'No amount',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Riwayat",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.search, color: Colors.white),
            onSelected: (String value) {
              setState(() {
                List<int> indexs = sequentialSearchSemuaKategori(value);
                filteredSpending = indexs.map((i) => spEnding[i]).toList();
              });
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem(
                    value: 'Transportasi',
                    child: Text('Transportasi'),
                  ),
                  PopupMenuItem(value: 'Makanan', child: Text('Makanan')),
                  PopupMenuItem(value: 'Akomodasi', child: Text('Akomodasi')),
                  PopupMenuItem(value: 'Hiburan', child: Text('Hiburan')),
                ],
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onSelected: (String value) {
              if (value == 'Oldest') {
                setState(() {
                  insertionSortWaktuLamaBaru();
                });
              } else if (value == 'Newest') {
                setState(() {
                  insertionSortBaruLama();
                });
              } else if (value == 'Most') {
                setState(() {
                  insertionSortSpendingBesarKecil();
                });
              } else if (value == 'Least') {
                setState(() {
                  insertionSortSpendingKecilBesar();
                });
              }
               filteredSpending = List.from(spEnding); 
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem(value: 'Oldest', child: Text('Terlama')),
                  PopupMenuItem(value: 'Newest', child: Text('Terbaru')),
                  PopupMenuItem(value: 'Most', child: Text('Terbanyak')),
                  PopupMenuItem(value: 'Least', child: Text('Tersedikit')),
                ],
          ),
        ],
      ),
      body: buildSpendingHistory(),
    );
  }
}
