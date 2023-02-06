import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/models/watch_list.dart';
import 'package:route_movies_app/screens/details-screen/details_view.dart';
import 'package:route_movies_app/services/local/cash_helper.dart';
import '../shared_widgets/movie_image_item.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CasheHelper>(
      builder: (context, myProvider, child) {
        //List<LocalMovieModel> watchList=myProvider.movieListToAll;
        return FutureBuilder(
          future: CasheHelper().getAllDataFromLocal(),
          builder: (context, snapshot) {
            List<LocalMovieModel> watchList=snapshot.data??[];
            return Scaffold(
                      appBar: AppBar(
                        title:const Text('Pull down to update your Watch List',style:TextStyle(fontSize: 15),),
                      ),
                        body: RefreshIndicator(
                          onRefresh: () async{
                            myProvider.getAllDataFromLocal();
                            setState(() {
                              
                            });
                            
                          },
                          child: ListView.separated(
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailsScreen(movieId:watchList[index].id.toInt()),));
                                            
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
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.all(8),
                                                width:MediaQuery.of(context).size.width*0.65,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(watchList[index].title,overflow:TextOverflow.ellipsis,textAlign:TextAlign.start,),
                                                    const SizedBox(height: 5,),
                                                    Text(watchList[index].date,overflow:TextOverflow.ellipsis,textAlign:TextAlign.start),
                                                    const SizedBox(height: 10,),
                                                    Text(watchList[index].description,overflow:TextOverflow.ellipsis,textAlign:TextAlign.start,maxLines: 4,),
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
                        ),
                    );
          }
        );
    
   } );
    }
      }

