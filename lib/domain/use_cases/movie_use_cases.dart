import 'package:hive/hive.dart';

import '../../data/models/watch_list.dart';
import '../repository/repo_movies.dart';

class MovieUseCases{
MovieRepository repo;
MovieUseCases({required this.repo});
Future<Box<dynamic>?> creatBoxDb()async{
 return await repo.creatBoxDb();
}
void storeDataLocally(
        {required id,
      required String title,
      required String date,
      required String imageUrl,
      required String description}
  ){
    repo.storeDataLocally(
      id: id,
      title: title,
      date: date,
      imageUrl: imageUrl,
      description: description
      );
  }

Future<List<LocalMovieModel>> getAllDataFromLocal()async{
 return await repo.getAllDataFromLocal();
}

deleteItemFromLocal(int? index){
  repo.deleteItemFromLocal(index);
}

Future<bool?> checkMovieIsExist({required num? id})async{
return await repo.checkMovieIsExist(id: id);
}

Future<void> clearBoxDb()async{
 repo.clearBoxDb();
}

}