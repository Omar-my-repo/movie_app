import 'package:flutter/material.dart';
import 'package:route_movies_app/models/movie_details.dart';




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

  class CoverDetailsImage extends StatelessWidget {
    String? imagePath;
   CoverDetailsImage({super.key, required this.imagePath});
 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage.assetNetwork(
                        placeholder:'assets/images/loading.gif' ,
                        image:'http://image.tmdb.org/t/p/w500/$imagePath',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.50,
                        fit: BoxFit.contain,
                      ),
        Positioned(
          top: MediaQuery.of(context).size.height*0.20,
          left: 145,
        child: Image.asset('assets/images/play-button.png',height: 70,width: 70,))
      ],
    );
  }
}



  