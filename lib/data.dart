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
  static int amount = 0;
  static String tipe = '';
  TimeOfDay waktu = TimeOfDay(hour: 0, minute: 0);
}

List<spend> spEnding = [];