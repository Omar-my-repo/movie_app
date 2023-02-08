import 'package:flutter/material.dart';
import 'package:route_movies_app/models/movie.dart';

import '../details-screen/details_view.dart';
import '../shared_widgets/top_rated_item.dart';

class RecommendedSection extends StatelessWidget {
  List<Movie> movies;

  RecommendedSection(this.movies);

  @override
  Widget build(BuildContext context) {
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
                        builder: (context) =>
                            DetailsScreen(movieId: movies[index].id),
                      ));
                }),
                child: SizedBox(
                  width: 100,
                  child: TopRatedItem(movies[index]),
                ));
          }),
    );
  }
}
