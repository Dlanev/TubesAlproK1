
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

int binarySearchKategori(String targetTipe) {
  int left = 0;
  int right = nData - 1;

  while (left <= right) {
    int mid = (left + right) ~/ 2;
    var midSpend = spEnding[mid];
    String midTipe = midSpend?.tipe ?? '';

    int comparison = midTipe.compareTo(targetTipe);
    if (comparison == 0) {
      return mid;
    } else if (comparison < 0) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}


List<int> binarySearchKategoriSemua(String targetTipe) {
  List<int> hasil = [];
  int index = binarySearchKategori(targetTipe);
  
  if (index == -1) return hasil;

  int left = index;
  while (left >= 0 && (spEnding[left]?.tipe ?? '') == targetTipe) {
    left--;
  }

  int right = index + 1;
  while (right < nData && (spEnding[right]?.tipe ?? '') == targetTipe) {
    right++;
  }

  for (int i = left + 1; i < right; i++) {
    hasil.add(i);
  }

  return hasil;
}
