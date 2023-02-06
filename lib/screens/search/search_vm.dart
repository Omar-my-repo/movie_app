import 'package:route_movies_app/base.dart';
import 'package:route_movies_app/models/movie.dart';
import 'package:route_movies_app/screens/search/search_navigator.dart';

import '../../services/remote/api_manager.dart';

class SearchViewModel extends BaseViewModel<SearchNavigator> {
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
