import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/presentation/screens/details-screen/details_view.dart';
import '../../watch_list_provider/watch_list_provider.dart';
import '../shared_widgets/movie_image_item.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
            create: (context) => WatchListProvider(),
            child: Consumer<WatchListProvider>(
                builder: (context, myProvider, child) {
              //myProvider.localMovies;
              if(myProvider.isDataLoaded==false){
                 myProvider.getAllDataFromLocal();
              }
              
              debugPrint(
                  'movie List in watch list screen :  ${myProvider.localMovies.length}');
              //myProvider.getAllDataFromLocal();
              return Scaffold(
                    appBar: AppBar(
                      title: const Text(
                        'Pull down to update your Watch List',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    body: RefreshIndicator(
                      onRefresh: () async {
                        myProvider.getAllDataFromLocal();
                        setState(() {});
                      },
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width * 0.25,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DetailsScreen(
                                                    movieId: myProvider
                                                        .localMovies[index].id
                                                        .toInt()),
                                              ));
                                        },
                                        child: movie_image_item(
                                          id: myProvider.localMovies[index].id,
                                          date: myProvider.localMovies[index].date,
                                          posterPath:
                                              myProvider.localMovies[index].imageUrl,
                                          title: myProvider.localMovies[index].title,
                                          description:
                                              myProvider.localMovies[index].description,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.all(8),
                                              width:
                                                  MediaQuery.of(context).size.width *
                                                      0.65,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    myProvider.localMovies[index].title,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                      myProvider
                                                          .localMovies[index].date,
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.start),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    myProvider
                                                        .localMovies[index].description,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 4,
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    )
                                  ]),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const Divider(color: Colors.white),
                          itemCount: myProvider.localMovies.length),
                    ),
                  );}
                )
              );
      }
        }
  

