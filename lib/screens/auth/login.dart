import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget _authTitle() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Login',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 3),
          Text('Enter your email and password'),
        ],
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      child: TextField(decoration: InputDecoration(hintText: 'Email')),
    );
  }

  Widget _inputPw() {
    return Stack(
      children: <Widget>[
        Container(
          child: TextField(decoration: InputDecoration(hintText: 'Password')),
        ),

        Align(
          alignment: Alignment.centerRight,
          child: IconButton(icon: Icon(Icons.visibility), onPressed: () {}),
        ),
      ],
    );
  }

  Widget _forgotPw() {
    return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Text('Forgot Password?'),
        ),
      ),
      onTap: () {
        print('Forgot Password?');
      },
    );
  }

  Widget _subMit() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
        ),
        child: Text('Login'), onPressed: () {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _authTitle(),
            _inputEmail(),
            _inputPw(),
            _forgotPw(),
            _subMit(),
            Text('Divider'),
            Text('Register'),
          ],
        ),
      ),
    );
  }
}
