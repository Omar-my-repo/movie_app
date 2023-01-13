import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_movies_app/models/Latest.dart';
import 'package:route_movies_app/screens/home_screen/movie_image_item.dart';

class TopSideSection extends StatelessWidget {
  Latest? movie;

  TopSideSection(this.movie);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: movie != null && movie?.backdropPath != null
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loading.gif',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        image:
                            'http://image.tmdb.org/t/p/w500${movie!.backdropPath}')
                    : Image.asset(
                        'assets/images/movie_backdrop_image_not_found.jpg',
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
              ),
              Expanded(
                  child: Row(
                children: [
                  const SizedBox(width: 150),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            movie != null
                                ? '${movie!.title}'
                                : 'Adult Movie has Blocked',
                            style: Theme.of(context).textTheme.subtitle2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movie != null && movie?.releaseDate != ''
                                ? ' ${movie!.releaseDate}'
                                : "${DateTime.now().year}",
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                  color: Color(0xffB5B4B4),
                                      fontWeight: FontWeight.bold,
                                    ),
                            //SizedBox(height: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: SizedBox(
                width: 130,
                height: 200,
                child: movie_image_item(movie?.posterPath)),
          ),
        ],
      ),
    );
  }
}
