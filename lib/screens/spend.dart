import 'package:flutter/material.dart';
import 'package:tubes_alpro/data.dart';
import 'package:tubes_alpro/screens/home/home.dart';
import 'package:tubes_alpro/widgets/widgets.dart';

class spenData extends StatefulWidget {
  @override
  _spenDataState createState() => _spenDataState();
}

class _spenDataState extends State<spenData> {
  final TextEditingController _controller1 = TextEditingController();
  String? _selectedType;

  final List<String> _transactionTypes = [
    'Transportasi',
    'Makanan',
    'Akomodasi',
    'Hiburan',
  ];

  @override
  void initState() {
    super.initState();
    if (nData == 0) {
      generateDummyData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spend')),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            wAuthTitle('Amount', 'Masukkan Jumlah Pengeluaran'),
            Container(
              child: TextField(
                controller: _controller1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Nominal'),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedType,
              hint: Text('Pilih Tipe Transaksi'),
              items:
                  _transactionTypes.map((type) {
                    return DropdownMenuItem(value: type, child: Text(type));
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            wTextDivider(''),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                final amount = int.tryParse(_controller1.text);
                if (amount == null || _selectedType == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Masukkan data yang valid'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                } else if (amount > budGet.Budget) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Jumlah melebihi budget perjalanan'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                } else if (nData == 20) {
                  nData = 20;
                  for (int i = 19; i > 0; i--) {
                    spEnding[i] = spEnding[i - 1];
                  }
                  spEnding[0] = spend(
                    amount: amount,
                    tipe: _selectedType!,
                    waktu: DateTime.now(),
                  );
                  budGet.Budget -= amount;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                } else {
                  for (int i = nData; i > 0; i--) {
                    spEnding[i] = spEnding[i - 1];
                  }
                  spEnding[0] = spend(
                    amount: amount,
                    tipe: _selectedType!,
                    waktu: DateTime.now(),
                  );
                  if (nData < 20) {
                    nData++;
                  }

                  budGet.Budget -= amount;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
