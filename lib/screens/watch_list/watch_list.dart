import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/base.dart';
import 'package:route_movies_app/provider/favorites_provider.dart';
import 'package:route_movies_app/screens/details-screen/details_view.dart';
import 'package:route_movies_app/screens/watch_list/watch_list_navigator.dart';
import 'package:route_movies_app/screens/watch_list/watch_list_vm.dart';

import '../shared_widgets/movie_image_item.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends BaseView<WatchList, WatchListViewModel>
    implements WatchListNavigator {
  @override
  WatchListViewModel initViewModel() {
    return WatchListViewModel();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FavoritesProvider>(context);

    if (provider.isDataLoaded == false) {
      provider.getAllDataFromLocal();
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      color: Theme.of(context).primaryColor,
      child: Consumer<FavoritesProvider>(builder: (_, favoritesProvider, __) {
        if (favoritesProvider.errorMessage != null) {
          return Center(
            child: Text(favoritesProvider.errorMessage!),
          );
        } else if (favoritesProvider.localMovies.isEmpty) {
          return const Center(
            child: Text('Empty watch list'),
          );
        }
        return ListView.separated(
          separatorBuilder: (context, index) =>
              const Divider(color: Colors.white),
          itemCount: favoritesProvider.localMovies.length,
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
                                    movieId: favoritesProvider
                                        .localMovies[index].id
                                        .toInt()),
                              ));
                        },
                        child: movie_image_item(
                          id: favoritesProvider.localMovies[index].id,
                          date: favoritesProvider.localMovies[index].date,
                          posterPath:
                              favoritesProvider.localMovies[index].imageUrl,
                          title: favoritesProvider.localMovies[index].title,
                          description:
                              favoritesProvider.localMovies[index].description,
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
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favoritesProvider.localMovies[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      favoritesProvider.localMovies[index].date,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    favoritesProvider
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
        );
      }),
    );
  }
}
