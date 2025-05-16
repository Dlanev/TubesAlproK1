import 'package:flutter/material.dart';
import 'package:tubes_alpro/splash.dart';

void main() => runApp(Wahuy());

class Wahuy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}
