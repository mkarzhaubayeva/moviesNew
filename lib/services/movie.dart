class Movie {
  String name;
  String description;
  List<genreType> genres;
  String rate;
  String length;
  String img;

  Movie({
    required this.name,
    required this.description,
    required this.genres,
    required this.rate,
    required this.length,
    required this.img});
}

enum genreType {
  action,
  adventure,
  comedy,
  crime,
  biography,
  drama,
  history,
  mystery,
  thriller,
  sport,
  scifi
}