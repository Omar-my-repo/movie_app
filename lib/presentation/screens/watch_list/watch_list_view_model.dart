import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:route_movies_app/domain/use_cases/movie_use_cases.dart';

import '../../../data/data_sources/services/local/cash_helper.dart';
import '../../../data/models/watch_list.dart';
import '../../../data/repository/repository_impl.dart';

class CashedDataViewModel extends ChangeNotifier{
   MovieUseCases? useCases = MovieUseCases(repo:MovieRepoImpl(local:CasheHelper()));
   //CashedDataViewModel({this.useCases});

  List<LocalMovieModel> watchList=[];

  Future<List<LocalMovieModel>>  getAllDataFromLocal()async{
    watchList = await useCases!.getAllDataFromLocal();
    notifyListeners();
    return watchList;
  }

  Future<Box<dynamic>?> creatBoxDb()async{
    return await useCases?.creatBoxDb();
  }

  void storeDataLocally(
        {required id,
      required String title,
      required String date,
      required String imageUrl,
      required String description}
  ){
    useCases?.storeDataLocally(
      id: id,
      title: title,
      date: date,
      imageUrl: imageUrl,
      description: description
      );
      notifyListeners();
  }

       deleteItemFromLocal(int? index){
         useCases?.deleteItemFromLocal(index);
         notifyListeners();
      }

       Future<bool?> checkMovieIsExist({required num? id})async{
        bool? isExist;
          isExist= await useCases?.checkMovieIsExist(id: id);
          notifyListeners();
          return isExist;
        
      }

      void clearBoxDb()async{
      useCases?.clearBoxDb();
      notifyListeners();
}

}