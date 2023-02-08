import 'package:route_movies_app/data/data_sources/services/remote/api_manager.dart';
import 'package:route_movies_app/data/models/trailers.dart';
import 'package:route_movies_app/data/models/popular.dart';
import 'package:route_movies_app/data/models/movie_details.dart';
import 'package:route_movies_app/data/models/Latest.dart';
import 'package:route_movies_app/data/models/watch_list.dart';
import 'package:hive/hive.dart';
import 'package:route_movies_app/domain/repository/repo_movies.dart';

import '../data_sources/services/local/cash_helper.dart';

class MovieRepoImpl extends MovieRepository {
  CasheHelper local;
  ApiManager remot;
  MovieRepoImpl({required this.local,required this.remot});

  //! Local Functions implementation
  @override
  Future<bool?> checkMovieIsExist({required num? id}) {
    return local.checkMovieIsExist(id: id);
  }

  @override
  Future<void> clearBoxDb() async {
    await local.clearBoxDb();
  }

  @override
  Future<Box?> creatBoxDb() async {
    return await local.creatBoxDb();
  }

  @override
  deleteItemFromLocal(int? index) {
    local.deleteItemFromLocal(index);
  }

  @override
  Future<List<LocalMovieModel>> getAllDataFromLocal() async {
    return await local.getAllDataFromLocal();
  }

  @override
  void storeDataLocally(
      {required id,
      required String title,
      required String date,
      required String imageUrl,
      required String description}
      ) {
    local.storeDataLocally(
        id: id,
        title: title,
        date: date,
        imageUrl: imageUrl,
        description: description);
  }


  //! Remote Functions implementation
  @override
  Future<Latest> getLatestMovie() async{
    return await remot.getLatestMovie();
  }

  @override
  Future<MovieDetails> getMovieDetails(num movieId) async{
    return await remot.getMovieDetails(movieId);
  }

  @override
  Future<TrailersModel> getMovieTrailerByID(num id) async{
    return await remot.getMovieTrailerByID(id);
  }

  @override
  Future<Popular> getPopularMovies()async {
    return await  remot.getPopularMovies();
  }

  @override
  Future<Popular> getRecommendedMovie(num movieId) async{
    return await remot.getRecommendedMovie(movieId);
  }

  @override
  Future<Popular> getTopRatedMovies() async{
    return await remot.getTopRatedMovies();
  }

  @override
  Future<Popular> searchMovieByName(String movieName) async{
    return await remot.searchMovieByName(movieName);
  }
}
