import 'package:route_movies_app/domain/Entity/movie_entity.dart';

/// poster_path : "/cezWGskPY5x7GaglTTRN4Fugfb8.jpg"
/// adult : false
/// overview : "When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!"
/// release_date : "2012-04-25"
/// genre_ids : [878,28,12]
/// id : 24428
/// original_title : "The Avengers"
/// original_language : "en"
/// title : "The Avengers"
/// backdrop_path : "/hbn46fQaRmlpBuUrEiFqv0GDL6Y.jpg"
/// popularity : 7.353212
/// vote_count : 8503
/// video : false
/// vote_average : 7.33

class Movie extends MovieEntity{
  Movie({
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
  }):super(
    posterPath:posterPath,
    adult: adult,
    overview:overview,
    backdropPath:backdropPath,
    genreIds:genreIds,
    id: id,
    originalLanguage: originalLanguage,
    originalTitle: originalTitle,
    popularity: popularity,
    releaseDate: releaseDate,
    title: title,
    video: video,
    voteAverage: voteAverage,
    voteCount: voteCount,
    
  );

  Movie.fromJson(dynamic json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'];
  }

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
}
