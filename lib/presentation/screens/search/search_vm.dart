import 'package:route_movies_app/base.dart';
import 'package:route_movies_app/presentation/screens/search/search_navigator.dart';
import '../../../data/data_sources/services/remote/api_manager.dart';
import '../../../data/models/movie.dart';

class SearchViewModel extends BaseViewModel<SearchNavigator>{

  List<Movie> filterdMovies = [];
  
  void searchMovieByName(String movieName) async {
    ///don't forget await ///
    await ApiManager.searchMovieByName(movieName).then((value) {
      var filter =
          value.results?.where((movie) => movie.adult == false).toList();
      filterdMovies = filter ?? [];
    });
    notifyListeners();
  }
}
