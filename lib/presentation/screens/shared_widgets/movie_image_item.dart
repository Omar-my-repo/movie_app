import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:route_movies_app/presentation/watch_list_provider/watch_list_provider.dart';

import '../../../data/models/watch_list.dart';

class movie_image_item extends StatelessWidget {
  num? id;
  String? title;
  String? date;
  String? posterPath;
  String? description;
  movie_image_item(
      {required this.id,
      required this.posterPath,
      required this.title,
      required this.date,
      this.description});

  @override
  Widget build(BuildContext context) {
    String? url = 'http://image.tmdb.org/t/p/w500$posterPath';
    bool isExist=Provider.of<WatchListProvider>(context).checkMovieIsExist(id:id);
    return Consumer<WatchListProvider>(
      builder: (context, value, child) {
      //value.localMovies;
      if(value.isDataLoaded==false){
        value.getAllDataFromLocal();
      }
      
      //bool isExist=value.checkMovieIsExist(id:id);
      return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    children: [
                      SizedBox(
                        child: isExist == false
                            ? posterPath != null
                                ? FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/loading.gif',
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                    height: double.infinity,
                                    image: url)
                                : Image.asset(
                                    'assets/images/movie_poster_image_not_found.jpg',
                                    fit: BoxFit.fill,
                                    height: double.infinity,
                                    width: double.infinity,
                                  )
                            : CachedNetworkImage(
                                imageUrl: url,
                                placeholder: (context, _) =>
                                    Image.asset('assets/images/loading.gif'),
                                errorWidget: (context, _, error) => Image.asset(
                                  'assets/images/movie_poster_image_not_found.jpg',
                                  fit: BoxFit.fill,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                      ),
                      InkWell(
                        onTap: (){
                          isExist =  value.checkMovieIsExist(id: id);
                          if (isExist == false) {
                            value.storeDataLocally(
                                id: id,
                                title: title ?? '',
                                date: date ?? '',
                                imageUrl: url,
                                description: description ?? '');
                            value.localMovies.add(LocalMovieModel(id!, title ?? '',
                                date ?? '', url, description ?? ''));
                            //value.getAllDataFromLocal();
                            isExist = true;
                          } else if (isExist == true) {
                                value.deleteItemFromLocal(id!);
                                //value.localMovies.removeAt(i);
                              
                            
                            //value.getAllDataFromLocal();
                            isExist = false;
                          }
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 27,
                              height: 36,
                              child: isExist == false
                                  ? ImageIcon(
                                      const AssetImage(
                                          'assets/images/bookmark_icon.png'),
                                      color: Colors.grey[800],
                                    )
                                  : const ImageIcon(
                                      AssetImage(
                                          'assets/images/Icon-awesome-bookmark.png'),
                                      color: Colors.amberAccent,
                                    ),
                            ),
                            isExist == false
                                ? const Positioned(
                                    height: 36,
                                    width: 27,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ))
                                : const Positioned(
                                    height: 36,
                                    width: 27,
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 20,
                                    ))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
      }
      
    }
  

