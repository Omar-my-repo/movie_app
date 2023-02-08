import 'dart:math';

import 'package:route_movies_app/base.dart';
import 'package:route_movies_app/models/movie.dart';
import 'package:route_movies_app/screens/home_screen/home_navigator.dart';

import '../../models/popular.dart';
import '../../services/remote/api_manager.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  String defaultErrorMessage = 'Something went wrong';

  Movie? topSectionMovie = null;
  String? topSectionErrorMessage = null;

  List<Movie>? newReleasedMovies;
  String? newReleasedErrorMessage;

  List<Movie>? recommendedSectionMovies;
  String? recommendedSectionErrorMessage;

  void getLatestMovies() async {
    try {
      /// filtering movies and return random one
      Popular response = await ApiManager.getLatestMovie();
      List<Movie> familyMovies =
          response.results!.where((movie) => movie.adult == false).toList();
      Random random = new Random();
      int randomNumber = random.nextInt(familyMovies.length);
      topSectionMovie = familyMovies[randomNumber];
      notifyListeners();
    } catch (e) {
      topSectionErrorMessage = defaultErrorMessage;
    }
  }

  void getPopularMovies() async {
    try {
      Popular response = await ApiManager.getPopularMovies();
      newReleasedMovies = response.results;
      notifyListeners();
    } catch (e) {
      newReleasedErrorMessage = defaultErrorMessage;
    }
  }

  void getTopRatedMovies() async {
    try {
      var response = await ApiManager.getTopRatedMovies();
      recommendedSectionMovies = response.results;

      notifyListeners();
    } catch (e) {
      recommendedSectionErrorMessage = defaultErrorMessage;
    }
  }
}
