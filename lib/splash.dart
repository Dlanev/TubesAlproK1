import 'package:flutter/material.dart';
import 'package:tubes_alpro/screens/auth/login.dart';
import 'package:tubes_alpro/screens/home/home.dart';
import 'package:tubes_alpro/widgets/widgets.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkUserSementara(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: wAppLoading());
  }

  void _checkUserSementara(bool user) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => user ? Home() : Login()),
    );
  }
}
