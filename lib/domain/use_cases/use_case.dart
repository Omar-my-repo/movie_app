import 'package:hive/hive.dart';
import 'package:route_movies_app/presentation/screens/trailers_screen/trailers.dart';

import '../../data/models/Latest.dart';
import '../../data/models/movie_details.dart';
import '../../data/models/popular.dart';
import '../../data/models/trailers.dart';
import '../../data/models/watch_list.dart';
import '../repository/repo_movies.dart';

class MovieUseCases{
MovieRepository repo;
MovieUseCases({required this.repo});

//! All use cases related to local data
Future<Box<dynamic>?> creatBoxDb()async{
 return await repo.creatBoxDb();
}
void storeDataLocally(
        {required id,
      required String title,
      required String date,
      required String imageUrl,
      required String description}
  ){
    repo.storeDataLocally(
      id: id,
      title: title,
      date: date,
      imageUrl: imageUrl,
      description: description
      );
  }

Future<List<LocalMovieModel>> getAllDataFromLocal()async{
 return await repo.getAllDataFromLocal();
}

deleteItemFromLocal(int? index){
  repo.deleteItemFromLocal(index);
}

Future<bool?> checkMovieIsExist({required num? id})async{
return await repo.checkMovieIsExist(id: id);
}

Future<void> clearBoxDb()async{
 repo.clearBoxDb();
}

//! All use cases related to remot date

Future<Latest> getLatestMovie()async{
  return await repo.getLatestMovie(); 
}

Future<Popular> getPopularMovies()async{
  return await repo.getPopularMovies();
}

Future<Popular> getTopRatedMovies()async{
  return await repo.getTopRatedMovies();
}

Future<MovieDetails> getMovieDetails(num movieId)async{
  return await repo.getMovieDetails(movieId);
}

Future<Popular> getRecommendedMovie(num movieId)async{
  return await repo.getRecommendedMovie(movieId);
}

Future<Popular> searchMovieByName(String movieName)async{
  return await repo.searchMovieByName(movieName);
}

Future<TrailersModel> getMovieTrailerByID(num id)async{
  return await repo.getMovieTrailerByID(id);
}
}

