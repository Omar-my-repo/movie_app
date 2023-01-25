import 'package:route_movies_app/models/movie_details.dart';

/// status_message : "Invalid API key: You must be granted a valid key."
/// success : false
/// status_code : 7
/// adult : false
/// backdrop_path : null
/// belongs_to_collection : null
/// budget : 0
/// genres : [{"id":99,"name":"Documentary"}]
/// homepage : ""
/// id : 413323
/// imdb_id : "tt5852644"
/// original_language : "en"
/// original_title : "Deadpool: From Comics to Screen... to Screen"
/// overview : "This documentary divided into five segments examines the source and its path to the movies, backstory, special effects story/character areas, cast and performances. It includes notes from Reynolds, Liefeld, Miller, Wernick, Reese, executive producers Aditya Sood and Stan Lee, co-creator/comics writer Fabian Nicieza, producer Simon Kinberg, comics writer Joe Kelly, specialty costume designer Russell Shinkle, makeup designer Bill Corso, production designer Sean Haworth, director of photography Ken Seng, executive producer/unit production manager John J. Kelly, previs supervisor Franck Balson, stunt coordinator Philip J. Silvera, visual effects supervisors Pauline Duvall and Jonathan Rothbart, visual effects producer Annemarie Griggs, 2nd unit director/stunt coordinator Robert Alonzo, special effects coordinator Alex Burdett, utility stunts Regis Harrington, composer Tom Holkenberg, and actors Morena Baccarin, TJ Miller, Brianna Hildebrand, Leslie Uggams, Ed Skrein, and Gina Carano."
/// popularity : 0
/// poster_path : "/chV0avy5ogIB2PMTInT4KpHDzwj.jpg"
/// production_companies : []
/// production_countries : []
/// release_date : "2016-05-10"
/// revenue : 0
/// runtime : 80
/// spoken_languages : []
/// status : "Released"
/// tagline : ""
/// title : "Deadpool: From Comics to Screen... to Screen"
/// video : false
/// vote_average : 0
/// vote_count : 0

class Latest extends MovieDetails {
  Latest({
    this.statusMessage,
    this.success,
    this.statusCode,
  }) : super();

  Latest.fromJson(dynamic json) {
    statusMessage = json['status_message'];
    success = json['success'];
    statusCode = json['status_code'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  String? statusMessage;
  bool? success;
  num? statusCode;
}

/// id : 99
/// name : "Documentary"
