import 'package:flutter/material.dart';
import 'package:route_movies_app/models/movie.dart';
import 'package:route_movies_app/screens/shared_widgets/movie_image_item.dart';

import '../../shared/contants.dart';

class TopRatedItem extends StatelessWidget {
  Movie movie;

  TopRatedItem(this.movie);

  @override
  Widget build(BuildContext context) {
    print(movie.id);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff343534),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: 100,
            child: movie.posterPath != null
                ? movie_image_item(
                    posterPath: movie.posterPath,
                    id: movie.id,
                    date: movie.releaseDate,
                    title: movie.title,
                    description: movie.overview,
                  )
                : Image.asset(
                    'assets/images/loading.gif',
                    fit: BoxFit.cover,
                  ),
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.only(top: 4, right: 4, bottom: 6, left: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${roundDouble(movie.voteAverage!.toDouble(), 1)}',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                  const SizedBox(height: 2),
                  Expanded(
                    child: Text(
                      '${movie.title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    //movie time is static we can modified it later.
                    ' ${movie.releaseDate?.substring(0, 4) ?? ' '} R. 1h 48m',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: const Color(0xffB5B4B4),
                        ),
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       movie.releaseDate?.substring(0, 4) ?? '',
                  //       style: Theme.of(context).textTheme.caption!.copyWith(
                  //             color: const Color(0xffB5B4B4),
                  //           ),
                  //     ),
                  //     const SizedBox(width: 12),
                  //     Text(
                  //       '${movie.id}',
                  //       style: Theme.of(context).textTheme.caption!.copyWith(
                  //             color: const Color(0xffB5B4B4),
                  //           ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
