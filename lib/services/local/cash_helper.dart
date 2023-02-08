import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:route_movies_app/models/watch_list.dart';

class CasheHelper {
  //bool isExist=false;
//  List<LocalMovieModel> movieListToAll=[];

  //!Creat Hive Box Database
  Future<Box<dynamic>?> creatBoxDb() async {
    try {
      var box = await Hive.openBox('movie');
      return box;
    } catch (error) {
      return null;
    }
  }

//! Add Movie Model To DB ---> Hive
  void storeDataLocally(
      {required id,
      required String title,
      required String date,
      required String imageUrl,
      required String description}) {
    try {
      var box = Hive.box('movie');
      box.add(LocalMovieModel(id, title, date, imageUrl, description));
      debugPrint('Added Successfully');
    } catch (error) {
      // debugPrint('--->$error<---');
    }
  }

  //! get All Data from Local DB -->Hive
  Future<List<LocalMovieModel>> getAllDataFromLocal() async {
    var box = await creatBoxDb();
    List<LocalMovieModel> movieList =
        box!.values.map((value) => value as LocalMovieModel).toList();
    for (var element in movieList) {
      debugPrint('------->${element.id}');
    }
    return movieList;
  }

  //!deleteItemByIndex
  //?the list index and DB index is the same
  void deleteItemFromLocal(int? index) async {
    var box = await creatBoxDb();
    try {
      box?.deleteAt(index!);
      debugPrint('--->$index is deleted ..!!<---');
    } catch (error) {
      debugPrint('--->$error<---');
    }
  }

  //! check if the movie is in Local list or not
  Future<bool> checkMovieIsExist({required num id}) async {
    var box = await creatBoxDb();
    List<LocalMovieModel> movieList =
        box!.values.map((value) => value as LocalMovieModel).toList();
    for (var element in movieList) {
      if (element.id == id) {
        return true;
      }
    }
    return false;
  }

  //!Creat Hive Box Database
  Future<void> clearBoxDb() async {
    try {
      var box = await Hive.openBox('movie');
      debugPrint('Box is deleted!!');
      box.clear();
    } catch (error) {
      debugPrint('---->$error');
    }
  }
}
