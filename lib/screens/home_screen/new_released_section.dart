import 'package:flutter/material.dart';
import 'package:route_movies_app/models/movie.dart';

import '../details-screen/details_view.dart';
import '../shared_widgets/movie_image_item.dart';

class NewReleasdSection extends StatelessWidget {
  List<Movie> movies;

  NewReleasdSection(this.movies);

  @override
  Widget build(BuildContext context) {
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
                              DetailsScreen(movieId: movies[index].id),
                        ));
                  },
                  child: movie_image_item(
                    id: movies[index].id?.toInt(),
                    date: movies[index].releaseDate,
                    posterPath: movies[index].posterPath,
                    title: movies[index].title,
                    description: movies[index].overview,
                  )),
            );
          }),
    );
  }
}
