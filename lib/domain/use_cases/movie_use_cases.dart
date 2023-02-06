import '../../data/models/watch_list.dart';
import '../repository/repo_movies.dart';

class MovieUseCases{
MovieRepository repo;
MovieUseCases({required this.repo});

Future<List<LocalMovieModel>> getAllDataFromLocal()async{
 return await repo.getAllDataFromLocal();
}

}