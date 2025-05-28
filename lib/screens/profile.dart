import 'package:flutter/material.dart';
import 'package:tubes_alpro/data.dart';

class proFile extends StatefulWidget {
  @override
  State<proFile> createState() => _Profile();
}

class _Profile extends State<proFile> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: file(context),
    );
  }

  Widget file(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.person, color: Colors.deepPurple),
              SizedBox(width: 10),
              Text(
                'Username: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(authData.username),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.lock, color: Colors.deepPurple),
              SizedBox(width: 10),
              Text(
                'Password: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(authData.password),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  } 
}
