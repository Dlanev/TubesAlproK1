import 'package:flutter/material.dart';

class authData {
  static String username = '';
  static String password = '';
}

class budGet {
  static int Balance = 0; 
  static int Budget = 0;
}

class spend {
  int? amount = 0;
  String tipe = '';
  TimeOfDay waktu = TimeOfDay(hour: 0, minute: 0);

  spend({required this.amount, required this.tipe});
}

List<spend> spEnding = [];

int nData = 0;