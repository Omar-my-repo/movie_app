import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/data/data_sources/services/local/cash_helper.dart';
import 'package:route_movies_app/presentation/screens/details-screen/details_view.dart';
import 'package:route_movies_app/presentation/screens/shared_widgets/movie_image_item.dart';
import 'package:route_movies_app/presentation/screens/home_screen/shimmer_ui/newreleased_section_shimmer.dart';
import 'package:route_movies_app/presentation/screens/home_screen/shimmer_ui/top_rated_section_shimmer.dart';
import 'package:route_movies_app/presentation/screens/shared_widgets/top_rated_item.dart';
import 'package:route_movies_app/presentation/screens/home_screen/top_side_section.dart';
import '../../../data/models/Latest.dart';
import '../../../data/models/movie.dart';
import '../../../data/models/popular.dart';
import '../../../data/data_sources/services/remote/api_manager.dart';
import '../../../data/repository/repository_impl.dart';
import '../../../domain/use_cases/use_case.dart';
import '../../watch_list_provider/watch_list_provider.dart';
import 'shimmer_ui/top_section_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieUseCases useCase =MovieUseCases(repo:MovieRepoImpl(local: CasheHelper(),remot:ApiManager()));
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WatchListProvider(),
      child: RefreshIndicator(
        onRefresh: () async{
          setState(() {
            
          });
        },
        child: Container(
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<Latest>(
                    future: useCase.getLatestMovie(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const TopSectionShimmer();
                      }
                      if (snapshot.hasError) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Center(
                            child: Text(
                              'Something went wrong pleas check your internet connection',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                      if (snapshot.data?.statusMessage != null) {
                        return Center(child: Text(snapshot.data!.statusMessage!));
                      }
                      Latest movie = snapshot.data!;
                      print(movie.posterPath);
                      print(movie.backdropPath);
            
                      //removing adult movies from showing off
                      Latest? newMovie;
                      if (movie.adult == false) {
                        newMovie = movie;
                        return TopSideSection(newMovie);
                      }
                      print('===adult movie has been blocked===');
                      print('-------> movie Id : ${movie.id}');
                      return TopSideSection(newMovie);
                    }),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Released',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const SizedBox(height: 10),
                      FutureBuilder<Popular>(
                        future: useCase.getPopularMovies(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const NewReleasedSectionShimmer();
                          }
                          if (snapshot.hasError) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Center(
                                child: Text(
                                  'Something went wrong pleas check your internet connection',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                          if (snapshot.data?.statusMessage != null) {
                            return Center(
                                child: Text(snapshot.data!.statusMessage!));
                          }
                          List<Movie> movies = snapshot.data!.results ?? [];
                          
                          return SizedBox(
                            height: 130,
                            child: ListView.separated(
                                itemCount: movies.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 16);
                                },
                                itemBuilder: (context, index) {
                                  debugPrint('index : $index');
                                  return SizedBox(
                                    width: 100,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DetailsScreen(
                                                    movieId: movies[index]
                                                        .id),
                                              ));
                                        },
                                        child: movie_image_item(
                                          id:movies[index].id?.toInt(),
                                          date:movies[index].releaseDate,
                                          posterPath: movies[index].posterPath,
                                          title:movies[index].title,
                                          description: movies[index].overview,
            
                                        )),
                                  );
                                }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommended',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const SizedBox(height: 10),
                      FutureBuilder<Popular>(
                        future: useCase.getTopRatedMovies(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const TopRatedSectionShimmer();
                          }
                          if (snapshot.hasError) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Center(
                                child: Text(
                                  'Something went wrong pleas check your internet connection',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                          if (snapshot.data?.statusMessage != null) {
                            return Center(
                                child: Text(snapshot.data!.statusMessage!));
                          }
                          List<Movie> movies = snapshot.data!.results ?? [];
            
                          return SizedBox(
                            height: 210,
                            child: ListView.separated(
                                itemCount: movies.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 16);
                                },
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailsScreen(
                                                  movieId:
                                                      movies[index].id),
                                            ));
                                      }),
                                      child: SizedBox(
                                        width: 100,
                                        child: TopRatedItem(movies[index]),
                                      ));
                                }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
