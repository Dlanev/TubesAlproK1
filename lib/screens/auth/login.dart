import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text('Title & Subtitle'),
          Text('Input Email'),
          Text('Input Password'),
          Text('Forgot Password'),
          Text('Login'),
          Text('Divider'),
          Text('Register'),
        ])
      )
    );
  }
}