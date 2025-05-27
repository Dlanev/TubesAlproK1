
class authData {
  static String username = '';
  static String password = '';
}

class budGet {
  static int Balance = 0; 
  static int Budget = 0;
}

class spend {
  int? amount ;
  String? tipe;
  DateTime? waktu;

}

List<spend?> spEnding = List.filled(20, null);

int nData = 0;