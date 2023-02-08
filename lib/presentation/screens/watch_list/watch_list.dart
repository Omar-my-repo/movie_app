import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/data/repository/repository_impl.dart';
import 'package:route_movies_app/domain/use_cases/movie_use_cases.dart';
import 'package:route_movies_app/presentation/screens/details-screen/details_view.dart';
import 'package:route_movies_app/data/data_sources/services/local/cash_helper.dart';
import 'package:route_movies_app/presentation/screens/watch_list/watch_list_view_model.dart';
import '../shared_widgets/movie_image_item.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  CashedDataViewModel vm = CashedDataViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: vm.getAllDataFromLocal(),
      builder: (context, snapshot) {
        return ChangeNotifierProvider(
            create: (context) => vm,
            child: Consumer<CashedDataViewModel>(
                builder: (context, myProvider, child) {
              myProvider.watchList;
              myProvider.getAllDataFromLocal();
              debugPrint(
                  'movie List in watch list screen :  ${myProvider.watchList.length}');
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
                                                        .watchList[index].id
                                                        .toInt()),
                                              ));
                                        },
                                        child: movie_image_item(
                                          id: myProvider.watchList[index].id,
                                          date: myProvider.watchList[index].date,
                                          posterPath:
                                              myProvider.watchList[index].imageUrl,
                                          title: myProvider.watchList[index].title,
                                          description:
                                              myProvider.watchList[index].description,
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
                                                    myProvider.watchList[index].title,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                      myProvider
                                                          .watchList[index].date,
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.start),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    myProvider
                                                        .watchList[index].description,
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
                          itemCount: myProvider.watchList.length),
                    ),
                  );}
                )
              );
      }
    );
        }
  }

