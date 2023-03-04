import 'package:route_movies_app/base.dart';
import 'package:route_movies_app/presentation/screens/search/search_navigator.dart';
import '../../../data/data_sources/services/local/cash_helper.dart';
import '../../../data/data_sources/services/remote/api_manager.dart';
import '../../../data/models/movie.dart';
import '../../../data/repository/repository_impl.dart';
import '../../../domain/use_cases/use_case.dart';

class SearchViewModel extends BaseViewModel<SearchNavigator>{
MovieUseCases useCase =MovieUseCases(repo:MovieRepoImpl(local: CasheHelper(),remot:ApiManager()));
  List<Movie> filterdMovies = [];
  
  void searchMovieByName(String movieName) async {
    ///don't forget await ///
    await useCase.searchMovieByName(movieName).then((value) {
      var filter =
          value.results?.where((movie) => movie.adult == false).toList();
      filterdMovies = filter ?? [];
    });
    notifyListeners();
  }
}
