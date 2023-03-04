import 'package:flutter/material.dart';
import 'package:route_movies_app/data/data_sources/services/remote/api_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../data/data_sources/services/local/cash_helper.dart';
import '../../../data/models/trailers.dart';
import '../../../data/repository/repository_impl.dart';
import '../../../domain/use_cases/use_case.dart';

class TrailerScreen extends StatelessWidget {
  final num? id;
   TrailerScreen({super.key, required this.id});
   MovieUseCases useCase =MovieUseCases(repo:MovieRepoImpl(local: CasheHelper(),remot:ApiManager()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<TrailersModel>(
          future: useCase.getMovieTrailerByID(id!),
          builder: (context, snapshot) {
            TrailersModel trailers = snapshot.data!;
            if (snapshot.connectionState == ConnectionState.waiting ||
              id == null) {
            return Image.asset(
              'assets/images/loading.gif',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          } else if (snapshot.hasError) {
            return Image.asset(
              'assets/images/loading.gif',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          }

          if(trailers.id==null){
             return const Center(child: Text('No Trailer for this Movie'));
          }
            
            final YoutubePlayerController controller = YoutubePlayerController(
              initialVideoId: trailers.key ?? '',
              flags: const YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
                enableCaption: true,

              ),
            );
            return Column(
              children: [
                YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Text(trailers.name??'',style:const TextStyle(fontSize:20),),
                      const SizedBox(height: 10,),
                       Text(trailers.official==false?'This trailer is non Oficial on ${trailers.site}':'This is Oficial trailer on ${trailers.site}'),
                       
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
