extension MovieOrderExtension on String {
  String get convertMovieOrder {
    switch (this) {
      case 'IMDB Puanına Göre Yüksek':
        return 'vote_average.desc';
      case 'IMDB Puanına Göre Düşük':
        return 'vote_average.desc';
      case 'Popülerlik (Artan)':
        return 'popularity.asc';
      case 'Popülerlik (Azalan)':
        return 'popularity.desc';
      case 'Yıla Göre (Büyükten Küçüğe)':
        return 'release_date.desc';
      case 'Yıla Göre (Küçükten Büyüğe)':
        return 'release_date.asc';
      case 'İsime Göre (A-Z)':
        return 'original_title.asc';
      case 'İsime Göre (Z-A)':
        return 'original_title.desc';
      default:
        return '';
    }
  }
}
