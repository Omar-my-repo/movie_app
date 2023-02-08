class MovieEntity {
  String? posterPath;
  bool? adult;
  String? overview;
  String? releaseDate;
  List<num>? genreIds;
  num? id;
  String? originalTitle;
  String? originalLanguage;
  String? title;
  String? backdropPath;
  num? popularity;
  num? voteCount;
  bool? video;
  num? voteAverage;

  MovieEntity({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds, ////
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });
}
