extension LanguageIsoExtension on String {
  String get languageToIso {
    switch (this) {
      case 'Türkçe':
        return 'tr-TR';
      case 'Almanca':
        return 'de-DE';
      case 'Arapça':
        return 'ar-AR';
      case 'Çince':
        return 'zh-ZH';
      case 'Fransızca':
        return 'fr-FR';
      case 'İngilizce':
        return 'en-EN';
      case 'İspanyolca':
        return 'es-ES';
      case 'İtalyanca':
        return 'it-IT';
      case 'Japonca':
        return 'ja-JA';
      case 'Korece':
        return 'ko-KO';
      case 'Rusça':
        return 'ru-RU';
      default:
        return '';
    }
  }
}
