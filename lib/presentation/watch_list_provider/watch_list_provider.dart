import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../../data/data_sources/services/local/cash_helper.dart';
import '../../data/data_sources/services/remote/api_manager.dart';
import '../../data/models/watch_list.dart';
import '../../data/repository/repository_impl.dart';
import '../../domain/use_cases/use_case.dart';


class WatchListProvider extends ChangeNotifier {
  MovieUseCases useCase =MovieUseCases(repo:MovieRepoImpl(local: CasheHelper(),remot:ApiManager()));
  List<LocalMovieModel> localMovies = [];
  String? errorMessage;

  bool isDataLoaded = false;

  void getAllDataFromLocal() async {
    try {
      var movies = await useCase.getAllDataFromLocal();
      localMovies = movies;

      isDataLoaded = true;
      notifyListeners();
      print('====>local length: ${localMovies.length}');
    } catch (e) {
      errorMessage = 'error in getting data from local';
    }
  }

  bool checkMovieIsExist({required num? id}) {
    //هنا ممكن نسرش ف الليست ال معانا بدل ما نروح نسرش ف الداتابيز
    for (var elements in localMovies) {
      if (elements.id == id) {
        return true;
      }
    }
    return false;

    // return await CasheHelper().checkMovieIsExist(id: id);
  }

  //
  void storeDataLocally(
      {required id,
      required String title,
      required String date,
      required String imageUrl,
      required String description}) {
    try {
      CasheHelper().storeDataLocally(
          id: id,
          title: title,
          date: date,
          imageUrl: imageUrl,
          description: description);
      // هنا ممكن نضيف لليست ع لطول وبعدين ننوتفاي ليستنر
      getAllDataFromLocal();
    } catch (e) {}
  }

//
  void deleteItemFromLocal(num id) {
    for (int i = 0; i < localMovies.length; i++) {
      if (localMovies[i].id == id) {
        CasheHelper().deleteItemFromLocal(i);
        localMovies.removeAt(i);
        notifyListeners();
        return;
      }
    }
  }
}