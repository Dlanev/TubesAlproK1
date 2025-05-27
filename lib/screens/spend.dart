import 'package:flutter/material.dart';
import 'package:tubes_alpro/data.dart';
import 'package:tubes_alpro/screens/home/home.dart';
import 'package:tubes_alpro/widgets/widgets.dart';

class spenData extends StatefulWidget {
  @override
  _spenDataState createState() => _spenDataState();
}

class _spenDataState extends State<spenData>{
  final TextEditingController _controller1 = TextEditingController();
  String? _selectedType;

  final List<String> _transactionTypes = [
    'Transport',
    'Makanan',
    'Akomodasi',
    'Hiburan',
  ];

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
              items: _transactionTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
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
                    SnackBar(content: Text('Masukkan data yang valid')),
                  );
                } else if (amount > budGet.Budget) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Jumlah melebihi budget perjalanan'),
                    ),
                  );
                } else {
                  spEnding[nData]?.amount = amount;
                  spEnding[nData]?.tipe = _selectedType!; 
                  spEnding[nData]?.waktu = DateTime.now();
                  nData++;
                  budGet.Budget -= amount;
                  Navigator.push(
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
