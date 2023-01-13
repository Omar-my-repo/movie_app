import 'package:flutter/material.dart';

class movie_image_item extends StatelessWidget {
  String? posterPath;

  movie_image_item(this.posterPath);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: [
          SizedBox(
            child: posterPath != null
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                    image: 'http://image.tmdb.org/t/p/w500${posterPath}')
                : Image.asset(
                    'assets/images/movie_poster_image_not_found.jpg',
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  ),
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
