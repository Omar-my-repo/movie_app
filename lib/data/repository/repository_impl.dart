import 'package:route_movies_app/data/models/watch_list.dart';
import 'package:hive/hive.dart';
import 'package:route_movies_app/domain/repository/repo_movies.dart';

import '../data_sources/services/local/cash_helper.dart';

class MovieRepoImpl extends MovieRepository {
  CasheHelper local;
  MovieRepoImpl({required this.local});

  @override
  Future<bool?> checkMovieIsExist({required num? id}) {
    return local.checkMovieIsExist(id: id);
  }

  @override
  Future<void> clearBoxDb() async {
    await local.clearBoxDb();
  }

  @override
  Future<Box?> creatBoxDb() async {
    return await local.creatBoxDb();
  }

  @override
  deleteItemFromLocal(int? index) {
    local.deleteItemFromLocal(index);
  }

  @override
  Future<List<LocalMovieModel>> getAllDataFromLocal() async {
    return await local.getAllDataFromLocal();
  }

  @override
  void storeDataLocally(
      {required id,
      required String title,
      required String date,
      required String imageUrl,
      required String description}
      ) {
    local.storeDataLocally(
        id: id,
        title: title,
        date: date,
        imageUrl: imageUrl,
        description: description);
  }
}
