import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_movies_app/models/movie.dart';

import '../details-screen/details_view.dart';

class MovieCard extends StatelessWidget {
  Movie movie;

  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(movieId:movie.id),
            ));
      },
      child: SizedBox(
        width: double.infinity,
        // color: Colors.red,
        height: 90,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: double.infinity,
                width: 140,
                child: movie.posterPath != null
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loading.gif',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        image:
                            'http://image.tmdb.org/t/p/w500${movie.posterPath}')
                    : Image.asset(
                        'assets/images/movie_backdrop_image_not_found.jpg',
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    movie.title!,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    movie.releaseDate ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.white60),
                  ),
                  Text(
                    movie.overview!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.white60),
                  ),
                  SizedBox(height: 4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
