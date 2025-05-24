import 'package:flutter/material.dart';
import 'package:tubes_alpro/data.dart';
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
            ElevatedButton(
              onPressed: () {
                spEnding[nData].amount = int.tryParse(_controller1.text);
                spEnding[nData].tipe = _controller2.text;
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}