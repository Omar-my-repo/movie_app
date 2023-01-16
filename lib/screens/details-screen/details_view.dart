import 'dart:math';

import 'package:flutter/material.dart';
import 'package:route_movies_app/servises/api_manager.dart';
import '../shared_widgets/movie_image_item.dart';
import 'details_widgets.dart';

class DetailsScreen extends StatelessWidget {
  String? movieId;
  DetailsScreen(this.movieId, {super.key});
  double roundDouble(double value, int places) {
    num mod = pow(10.0, places) as double;
    return ((value * mod).round().toDouble() / mod);
  }

  static const String routeName = 'DetailsScreen';

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
        future: ApiManager.getMovieDetails(movieId ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          var movieDetails = snapshot.data!;
          var genresList = movieDetails.genres;
          return Scaffold(
            backgroundColor: const Color(0xFF121312),
            appBar: AppBar(
              title: Text(
                movieDetails.title ?? '',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Cover image in the top
                  Image.network(
                    'http://image.tmdb.org/t/p/w500/${movieDetails.posterPath}',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.50,
                    fit: BoxFit.contain,
                  ),

                  //Details Container in the center of Details screen
                  Container(
                    margin: const EdgeInsets.all(12),
                    //width: MediaQuery.of(context).size.width,
                    //height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movieDetails.title ?? ''),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          movieDetails.releaseDate ?? '',
                          style:
                              const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 10),
                                width: MediaQuery.of(context).size.width * 0.30,
                                height: 150,
                                child:
                                    movie_image_item(movieDetails.posterPath)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.62,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: buildCategoryChips(
                                          textTheme, genresList ?? []),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: 80,
                                    width: MediaQuery.of(context).size.width *
                                        0.62,
                                    child: SingleChildScrollView(
                                      scrollDirection:Axis.vertical,
                                      child: Column(
                                        children: [
                                          Text(
                                            movieDetails.overview ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 10,
                                          ),
                                        ],
                                      ),
                                    )),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/rate_star.png',
                                      fit: BoxFit.fill,
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${roundDouble(movieDetails.voteAverage!.toDouble(), 1)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: const Color(0xFF282A28),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    height: 270,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('More Like this '),
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 8,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => TopRatedItemm(),
                            itemCount: 5,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
