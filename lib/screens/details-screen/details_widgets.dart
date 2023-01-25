import 'package:flutter/material.dart';
import 'package:route_movies_app/models/movie_details.dart';

class DetailsImage extends StatelessWidget {


  DetailsImage();

  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: [
            SizedBox(
              width: 100,
              height:150,
              child:FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      image: 'http://image.tmdb.org/t/p/w500/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg')
            ),
            InkWell(
              onTap: (){},
              child: Stack(
                children: [
                  SizedBox(
                    width: 27,
                    height: 36,
                    child: ImageIcon(
                      const AssetImage('assets/images/bookmark_icon.png'),
                      color: Colors.grey[800],
                    ),
                  ),
                  const Positioned(
                      height: 36,
                      width: 27,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieType extends StatelessWidget {
  const MovieType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(5) ,
                          border:Border.all(color:Colors.white),
                          shape: BoxShape.rectangle
                        ),
                        child:const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Action'),
                        ),
                      );
  }
}

  //List<String> x = ['Action','Comedy'];
  List<Widget> buildCategoryChips(TextTheme textTheme,List<Genres> x) {
    return x.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          shape:const StadiumBorder(side: BorderSide(color:Colors.grey),),
          label: Text(category.name??''),
          labelStyle: textTheme.caption,
          backgroundColor: const Color(0xff282A28),

        ),
      );
    }).toList();
  }


  class TopRatedItemm extends StatelessWidget {
  //Movie movie;

  //TopRatedItem(this.movie);

  @override
  Widget build(BuildContext context) {
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
            child: movie_image_itemm(),
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
                        '7.7',
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                  const SizedBox(height: 2),
                  Expanded(
                    child: Text(
                      'x movie',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    //movie time is static we can modified it later.
                    'R. 1h 48m',
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

class movie_image_itemm extends StatelessWidget {
  //String? posterPath;

  //movie_image_item(this.posterPath);

  @override
  Widget build(BuildContext context) {
    //print(posterPath);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: [
          SizedBox(
            child:FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                    image: 'http://image.tmdb.org/t/p/w500/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg')
                  
          ),
          InkWell(
            onTap: () {},
            child: Stack(
              children: [
                SizedBox(
                  width: 27,
                  height: 36,
                  child: ImageIcon(
                    const AssetImage('assets/images/bookmark_icon.png'),
                    color: Colors.grey[800],
                  ),
                ),
                const Positioned(
                    height: 36,
                    width: 27,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
