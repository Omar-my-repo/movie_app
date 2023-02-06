import 'package:route_movies_app/base.dart';
import 'package:route_movies_app/models/latest.dart';
import 'package:route_movies_app/screens/home_screen/home_navigator.dart';

import '../../services/remote/api_manager.dart';

class HomeVieModel extends BaseViewModel<HomeNavigator> {
  bool isSelected = false;

  Future<Latest> getLatestMovies() async {
    try {
      return await ApiManager.getLatestMovie();
    } catch (e) {
      navigator!.showMessage('Something went wrong');
      throw e;
    }
  }

// setDocument(Movie movie) {
//   FirebaseUtils.instance
//       .setDocument(path: 'watchlist/${movie.id}', data: movie.toJson());
// }
}
