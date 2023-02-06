import 'package:flutter/cupertino.dart';
import 'package:route_movies_app/domain/use_cases/movie_use_cases.dart';

import '../../../data/models/watch_list.dart';

class WatchListViewModel extends ChangeNotifier{
   MovieUseCases? useCases;
   WatchListViewModel({this.useCases});

  List<LocalMovieModel> watchList=[];

  void getAllDataFromLocal()async{
    watchList = await useCases!.getAllDataFromLocal();
    notifyListeners();
  }




}