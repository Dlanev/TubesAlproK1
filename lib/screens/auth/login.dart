import 'package:flutter/material.dart';
import 'package:tubes_alpro/data.dart';
import 'package:tubes_alpro/screens/home/home.dart';
import 'package:tubes_alpro/widgets/widgets.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _userController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
  }

  void _validateInputs() {
    setState(() {
      _isButtonEnabled =
          _userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  Widget _authTitle() {
    return wAuthTitle('Login', 'Enter your username and password');
  }

  Widget _inputUser() {
    return TextField(
      controller: _userController,
      decoration: InputDecoration(hintText: 'Username'),
    );
  }

  Widget _inputPw() {
    return Stack(
      children: <Widget>[
        Container(
          child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(hintText: 'Password'),
            obscureText: true,
          ),
        ),

        Align(
          alignment: Alignment.centerRight,
          child: IconButton(icon: Icon(Icons.visibility), onPressed: () {
            
          }),
        ),
      ],
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
        child: Text('Login'),
        onPressed:
            _isButtonEnabled
                ? () {
                  authData.username = _userController.text;
                  authData.password = _passwordController.text;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home(
                    )),
                  );
                }
                : null,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _authTitle(),
              _inputUser(),
              _inputPw(),
              _subMit(),
            ],
          ),
        ),
      ),
    );
  }
}
