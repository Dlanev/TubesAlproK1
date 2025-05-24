import 'package:flutter/material.dart';
import 'package:tubes_alpro/data.dart';
import 'package:tubes_alpro/screens/home/home.dart';
import 'package:tubes_alpro/widgets/widgets.dart';

class spenData extends StatelessWidget {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              child: TextField(
                controller: _controller2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Tipe Transaksi'),
              ),
            ),
            wTextDivider(''),
            ElevatedButton(
              onPressed: () {
                final amount = int.tryParse(_controller1.text);
                final tipe = _controller2.text;

                if (amount == null || tipe.isEmpty) {
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
                  spEnding.add(spend(amount: amount, tipe: tipe));
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
