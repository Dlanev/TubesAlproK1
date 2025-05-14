import 'package:flutter/material.dart';
import 'package:tubes_alpro/splash.dart';

void main() => runApp(Wahuy());

class Wahuy extends StatelessWidget {
  const Wahuy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash()
    );
  }
}