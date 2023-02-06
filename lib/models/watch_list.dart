import 'package:hive/hive.dart';

part 'watch_list.g.dart';

@HiveType(typeId: 1)
class LocalMovieModel extends HiveObject {
  //! Hive Local Model
  @HiveField(0)
  final num id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final String description;  //! <-----


LocalMovieModel(this.id,this.title,this.date,this.imageUrl,this.description);

}