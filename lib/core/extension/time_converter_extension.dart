extension TimeConverter on String {
  String get monthString {
    if (this == '01') return 'Ocak';
    if (this == '02') return 'Şubat';
    if (this == '03') return 'Mart';
    if (this == '04') return 'Nisan';
    if (this == '05') return 'Mayıs';
    if (this == '06') return 'Haziran';
    if (this == '07') return 'Temmuz';
    if (this == '08') return 'Ağustos';
    if (this == '09') return 'Eylül';
    if (this == '10') return 'Ekim';
    if (this == '11') return 'Kasım';
    if (this == '12') return 'Aralık';
    return '';
  }

  String get getDay {
    if (this[0] == '0') return this[1];
    return this;
  }
}
