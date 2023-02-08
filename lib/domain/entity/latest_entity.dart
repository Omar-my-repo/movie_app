import 'package:route_movies_app/domain/Entity/movie_entity.dart';

class LatestEntity extends MovieEntity {
  String? statusMessage;
  bool? success;
  num? statusCode;
  
  LatestEntity({
    this.statusMessage,
    this.success,
    this.statusCode,
  }) : super();
}