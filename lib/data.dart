
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
  spend({this.amount, this.tipe, this.waktu});
}

List<spend?> spEnding = List.filled(20, null);

int nData = 0;

void insertionSortSpendingKecilBesar() {
  for (int i = 1; i < nData; i++) {
    var key = spEnding[i];
    int j = i - 1;

    while (j >= 0 && spEnding[j] != null && key != null && (spEnding[j]!.amount ?? 0) > (key.amount ?? 0)) {
      spEnding[j + 1] = spEnding[j];
      j = j - 1;
    }
    spEnding[j + 1] = key;
  }
}

void insertionSortSpendingBesarKecil() {
  for (int i = 1; i < nData; i++) {
    var key = spEnding[i];
    int j = i - 1;

    while (j >= 0 && spEnding[j] != null && key != null && (spEnding[j]!.amount ?? 0) < (key.amount ?? 0)) {
      spEnding[j + 1] = spEnding[j];
      j = j - 1;
    }
    spEnding[j + 1] = key;
  }
}


void insertionSortWaktuLamaBaru() {
  for (int i = 1; i < nData; i++) {
    var key = spEnding[i];
    int j = i - 1;

    while (j >= 0 && spEnding[j] != null && key != null) {
      DateTime keyDate = key.waktu ?? DateTime(1970);
      DateTime jDate = spEnding[j]!.waktu ?? DateTime(1970);

      if (jDate.isAfter(keyDate)) {
        spEnding[j + 1] = spEnding[j];
        j = j - 1;
      } else {
        break;
      }
    }
    spEnding[j + 1] = key;
  }
}

void insertionSortBaruLama() {
  for (int i = 1; i < nData; i++) {
    var key = spEnding[i];
    int j = i - 1;

    while (j >= 0 && spEnding[j] != null && key != null) {
      DateTime keyDate = key.waktu ?? DateTime(1970); 
      DateTime jDate = spEnding[j]!.waktu ?? DateTime(1970);

      if (jDate.isBefore(keyDate)) {
        spEnding[j + 1] = spEnding[j];
        j = j - 1;
      } else {
        break;
      }
    }
    spEnding[j + 1] = key;
  }
}

int sequentialSearchKategori(List<int> data, int target) {
  for (int i = 0; i < nData;  i++) {
    if (spEnding[i] == target) {
      return i;
    }
  };
  return -1;
}

List<int> sequentialSearchSemuaKategori(String targetTipe) {
  List<int> hasil = [];

  for (int i = 0; i < nData; i++) {
    if ((spEnding[i]?.tipe ?? '') == targetTipe) {
      hasil.add(i);
    }
  }

  return hasil;
}
