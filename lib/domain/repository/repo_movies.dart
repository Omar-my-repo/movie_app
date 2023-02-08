import 'package:hive/hive.dart';

import '../../data/models/Latest.dart';
import '../../data/models/movie_details.dart';
import '../../data/models/popular.dart';
import '../../data/models/trailers.dart';
import '../../data/models/watch_list.dart';

abstract class MovieRepository {

  //! Remote Repo Abstracts Functions
  Future<Latest> getLatestMovie();
  Future<Popular> getPopularMovies();
  Future<Popular> getTopRatedMovies();
  Future<MovieDetails> getMovieDetails(num movieId);
  Future<Popular> getRecommendedMovie(num movieId);
  Future<Popular> searchMovieByName(String movieName);
  Future<TrailersModel> getMovieTrailerByID(num id);

  
  //! Local Repo Abstracts Functions
  Future<Box<dynamic>?> creatBoxDb();
  void storeDataLocally(
      {required id,
      required String title,
      required String date,
      required String imageUrl,
      required String description});
  Future<List<LocalMovieModel>> getAllDataFromLocal();
  deleteItemFromLocal(int? index);
  Future<bool?> checkMovieIsExist({required num? id});
  Future<void> clearBoxDb();
}
