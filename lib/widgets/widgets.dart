import 'package:flutter/material.dart';

Widget wAppLoading() {
  return Center(child: CircularProgressIndicator());
}

Widget wAuthTitle(String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 3),
          Text(subtitle),
        ],
      ),
    );
  }

  Widget wTextDivider(String words){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(words),
          ),
          Expanded(child: Divider()),
        ],
      ),
    );
  }