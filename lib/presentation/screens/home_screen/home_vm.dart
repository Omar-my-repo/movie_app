import 'package:route_movies_app/base.dart';
import 'package:route_movies_app/presentation/screens/home_screen/home_navigator.dart';

import '../../../data/data_sources/services/remote/api_manager.dart';
import '../../../data/models/Latest.dart';

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
