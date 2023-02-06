import 'package:hive/hive.dart';

import '../../data/models/watch_list.dart';

abstract class MovieRepository{


  //! Local Repo 
  Future<Box<dynamic>?> creatBoxDb();
  void storeDataLocally(
        {required id,
      required String title,
      required String date,
      required String imageUrl,
      required String description}
  );
  Future<List<LocalMovieModel>> getAllDataFromLocal();
  deleteItemFromLocal(int? index);
  Future<bool?> checkMovieIsExist({required num? id});
  Future<void> clearBoxDb();
}
