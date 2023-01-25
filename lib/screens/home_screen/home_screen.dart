import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_movies_app/models/movie.dart';
import 'package:route_movies_app/screens/details-screen/details_view.dart';
import 'package:route_movies_app/screens/shared_widgets/movie_image_item.dart';
import 'package:route_movies_app/screens/home_screen/shimmer_ui/newreleased_section_shimmer.dart';
import 'package:route_movies_app/screens/home_screen/shimmer_ui/top_rated_section_shimmer.dart';
import 'package:route_movies_app/screens/shared_widgets/top_rated_item.dart';
import 'package:route_movies_app/screens/home_screen/top_side_section.dart';

import '../../models/latest.dart';
import '../../models/popular.dart';
import '../../servises/api_manager.dart';
import 'shimmer_ui/top_section_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<Latest>(
                future: ApiManager.getLatestMovie(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const TopSectionShimmer();
                  }
                  if (snapshot.hasError) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal:30),
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
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                    future: ApiManager.getPopularMovies(),
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
                              return SizedBox(
                                width: 100,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsScreen(movies[index].id.toString()),
                                          ));
                                    },
                                    child: movie_image_item(
                                        movies[index].posterPath)),
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
                    future: ApiManager.getTopRatedMovies(),
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
                              return SizedBox(
                                width: 100,
                                child: TopRatedItem(movies[index]),
                              );
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
    );
  }
}
