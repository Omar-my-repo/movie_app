// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:route_movies_app/domain/Entity/movie_entity.dart';
import '../../data/models/movie_details.dart';

class MovieDetailsEntity extends MovieEntity {
  dynamic belongsToCollection;
  num? budget;
  List<Genres>? genres;
  String? homepage;
  String? imdbId;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  num? revenue;
  num? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;

  MovieDetailsEntity({
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
  }):super();
}
