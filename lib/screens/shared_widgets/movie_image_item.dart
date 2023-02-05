import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/services/local/cash_helper.dart';

import '../../models/watch_list.dart';

class movie_image_item extends StatefulWidget {
  num? id;
  String?title;
  String? date;
  String? posterPath;
  String? description;
  movie_image_item({required this.id,required this.posterPath,required this.title,required this.date,this.description});

  @override
  State<movie_image_item> createState() => _movie_image_itemState();
}

class _movie_image_itemState extends State<movie_image_item> {
  @override
  Widget build(BuildContext context) {
    String? url= 'http://image.tmdb.org/t/p/w500${widget.posterPath}';
    var myProvider=Provider.of<CasheHelper>(context,listen: false);
    //
    //print(widget.posterPath);
    return FutureBuilder(
      future: CasheHelper().checkMovieIsExist(id: widget.id),
      builder: (context, snapshot) {
        bool? isExist=snapshot.data;
        return ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: [
                    SizedBox(
                      child: widget.posterPath != null
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
                            ),
                    ),
                    InkWell(
                      onTap: () async{
                        if(isExist==false){
                          CasheHelper().storeDataLocally(
                          id:widget.id,
                          title:widget.title??'',
                          date:widget.date??'',
                          imageUrl:url,
                          description:widget.description??'');
                         await CasheHelper().getAllDataFromLocal().then((value) => myProvider.movieListToAll=value);
                         
                         isExist=true;
                         setState(() {
                           
                         });
                         
                      }
                      
                      else if(isExist==true){
                        List<LocalMovieModel> x=await CasheHelper().getAllDataFromLocal();
                        for(int i=0;i<x.length;i++){
                          if(x[i].id==widget.id){
                            CasheHelper().deleteItemFromLocal(i);
                            //myProvider.movieListToAll.removeAt(i);
                          }
                        }
                        //myProvider.movieListToAll.removeWhere((element) => element.id==widget.id);
                        isExist=false;
                       setState(() {
                         
                       });
                      }
                      },
                      
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 27,
                            height: 36,
                            child:  isExist==false? ImageIcon(
                              const AssetImage('assets/images/bookmark_icon.png'),
                              color: Colors.grey[800],
                            ):
                            const ImageIcon(
                              AssetImage('assets/images/Icon-awesome-bookmark.png'),
                              color: Colors.amberAccent,
                            )
                            ,
                          ),
                           isExist==false? const Positioned(
                              height: 36,
                              width: 27,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              )):
                              const Positioned(
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
      }
    );}
        
      }
    
  

