import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/models/watch_list.dart';
import 'package:route_movies_app/services/local/cash_helper.dart';
import '../shared_widgets/movie_image_item.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider=Provider.of<CasheHelper>(context,listen: false)..getAllDataFromLocal();
    List<LocalMovieModel> watchList=myProvider.movieListToAll;
    return Scaffold(
                appBar: AppBar(
                  title:const Text('Watch List'),
                ),
                  body: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width*0.25,
                                child: InkWell(
                                  onTap: () {
                                    //CasheHelper().getAllDataFromLocal();
                                    
                                  },
                                  child: movie_image_item(
                                    id:watchList[index].id,
                                    date:watchList[index].date,
                                    posterPath:watchList[index].imageUrl,
                                    title:watchList[index].title,
                                    description: watchList[index].description,
                                    ),
                                ),
                              ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(8),
                                        width:MediaQuery.of(context).size.width*0.65,
                                        child: Column(
                                          children: [
                                            Text(watchList[index].title,overflow:TextOverflow.ellipsis,),
                                            Text(watchList[index].date,overflow:TextOverflow.ellipsis,),
                                          ],
                                        ))
                                    ],
                                  ),
                                )
                            ]
                            
                        ),
                      );
                    },
                     separatorBuilder: (context, index) =>  const Divider(color:Colors.white),
                      itemCount: watchList.length),
              );
        
      }
    
      }

