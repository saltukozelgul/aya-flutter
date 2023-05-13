extension IMBDCategoryConverter on String {
  int get categoryNameToCode {
    switch (this) {
      case 'Aksiyon':
        return 28;
      case 'Macera':
        return 12;
      case 'Animasyon':
        return 16;
      case 'Komedi':
        return 35;
      case 'Suç':
        return 80;
      case 'Belgesel':
        return 99;
      case 'Dram':
        return 18;
      case 'Aile':
        return 10751;
      case 'Fantastik':
        return 14;
      case 'Tarih':
        return 36;
      case 'Korku':
        return 27;
      case 'Müzik':
        return 10402;
      case 'Gizem':
        return 9648;
      case 'Romantik':
        return 10749;
      case 'Bilim-Kurgu':
        return 878;
      case 'TV Film':
        return 10770;
      case 'Gerilim':
        return 53;
      case 'Savaş':
        return 10752;
      case 'Vahşi Batı':
        return 37;
      default:
        return 0;
    }
  }
}

extension IMBDCategoryConverterInt on String {
  String get codeToCategoryName {
    switch (this) {
      case '28':
        return 'Aksiyon';
      case '12':
        return 'Macera';
      case '16':
        return 'Animasyon';
      case '35':
        return 'Komedi';
      case '80':
        return 'Suç';
      case '99':
        return 'Belgesel';
      case '18':
        return 'Dram';
      case '10751':
        return 'Aile';
      case '14':
        return 'Fantastik';
      case '36':
        return 'Tarih';
      case '27':
        return 'Korku';
      case '10402':
        return 'Müzik';
      case '9648':
        return 'Gizem';
      case '10749':
        return 'Romantik';
      case '878':
        return 'Bilim-Kurgu';
      case '10770':
        return 'TV Film';
      case '53':
        return 'Gerilim';
      case '10752':
        return 'Savaş';
      case '37':
        return 'Vahşi Batı';
      default:
        return 'Belirlenemedi';
    }
  }
}
