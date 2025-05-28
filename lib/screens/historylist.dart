import 'package:flutter/material.dart';
import 'package:tubes_alpro/data.dart';

class History extends StatefulWidget {
  @override
  _histState createState() => _histState();
}

class _histState extends State<History> {
  Widget buildSpendingHistory() {
    final nonNullSpending = spEnding.where((spend) => spend != null).toList();

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
          "History",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: buildSpendingHistory(),
    );
  }
}
