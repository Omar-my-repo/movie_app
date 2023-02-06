import 'package:flutter/material.dart';
import 'package:route_movies_app/screens/shared_widgets/top_rated_item.dart';
import 'package:route_movies_app/screens/trailers_screen/trailers.dart';
import 'package:route_movies_app/services/remote/api_manager.dart';
import '../../shared/contants.dart';
import '../shared_widgets/movie_image_item.dart';
import 'details_widgets.dart';

class DetailsScreen extends StatelessWidget {
  num? movieId;
  DetailsScreen({this.movieId, super.key});

  static const String routeName = 'DetailsScreen';

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
        future: ApiManager.getMovieDetails(movieId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              movieId == null) {
            return Image.asset(
              'assets/images/loading.gif',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          } else if (snapshot.hasError) {
            return Image.asset(
              'assets/images/loading.gif',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          }
          var movieDetails = snapshot.data!;
          var genresList = movieDetails.genres;

          print(movieId);
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TrailerScreen(id: movieDetails.id),));
                    },
                    child: CoverDetailsImage(imagePath: movieDetails.posterPath)),

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
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: 140,
                                child:
                                    movie_image_item(
                                      id:movieDetails.id?.toInt(),
                                      date:movieDetails.releaseDate,
                                      posterPath:movieDetails.posterPath,
                                      title:movieDetails.title,
                                      description:movieDetails.overview,
                                    )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.67,
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
                                        0.67,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
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
                  FutureBuilder(
                      future: ApiManager.getRecommendedMovie(movieId!),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Image.asset(
                            'assets/images/loading.gif',
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }
                        return Container(
                          color: const Color(0xFF282A28),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          width: double.infinity,
                          height: 280,
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
                                    width: 5,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                movieId: snapshot.data!.results![index].id),
                                          ));
                                    },
                                    child: SizedBox(
                                        width: 120,
                                        child: TopRatedItem(
                                            snapshot.data!.results![index])),
                                  ),
                                  itemCount: snapshot.data!.results!.length,
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}
