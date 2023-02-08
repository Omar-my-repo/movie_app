import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:route_movies_app/models/movie_details.dart';
import 'package:route_movies_app/models/popular.dart';
import 'package:route_movies_app/shared/contants.dart';

import '../../models/trailers.dart';

class ApiManager {
  //generic function to get any api PATH
  static getJsonResponse({required String endPoint, String? query}) async {
    try {
      Uri url;
      if (query == null)
        url = Uri.https(baseApi, endPoint, {'api_key': apiKey});
      else
        url = Uri.https(baseApi, endPoint, {'api_key': apiKey, 'query': query});

      Response response = await http.get(url);
      var json = jsonDecode(response.body);
      return json;
    } catch (e) {
      print('---ERROR IN API MANAGER CANT GET RESPONSE:--MSG: $e');
      throw e;
    }
  }

  static Future<Popular> getLatestMovie() async {
    var json = await getJsonResponse(endPoint: '/3/trending/all/day');
    Popular movie = Popular.fromJson(json);
    return movie;
  }

  static Future<Popular> getPopularMovies() async {
    var json = await getJsonResponse(endPoint: popularMoviesEndPoint);
    Popular moviesList = Popular.fromJson(json);
    print('new released section movies length: ${moviesList.results?.length} ');
    return moviesList;
  }

  static Future<Popular> getTopRatedMovies() async {
    var json = await getJsonResponse(endPoint: topRatedMoviesEndPoint);
    Popular moviesList = Popular.fromJson(json);
    print('recommended section movies length: ${moviesList.results?.length} ');
    return moviesList;
  }
  

   //Movie Details Screen data 
  static Future<MovieDetails> getMovieDetails(num movieId) async {
    String movieDetailsEndPoint = '3/movie/$movieId';
    var json = await getJsonResponse(endPoint: movieDetailsEndPoint);
    MovieDetails movieDetails = MovieDetails.fromJson(json);
    return movieDetails;
  }

  static Future<Popular> getRecommendedMovie(num movieId) async {
    String movieDetailsEndPoint = '3/movie/$movieId/recommendations';
    var json = await getJsonResponse(endPoint: movieDetailsEndPoint);
    Popular moviesList = Popular.fromJson(json);
    return moviesList;
  }

  static Future<Popular> searchMovieByName(String movieName) async {
    String searchEndPint = '/3/search/movie';
    var json = await getJsonResponse(endPoint: searchEndPint, query: movieName);
    Popular moviesList = Popular.fromJson(json);
    return moviesList;
  }

  static  Future<TrailersModel> getMovieTrailerByID(num id) async {
    String trailersEndPount = '/3/movie/$id/videos';
    var json = await getJsonResponse(endPoint: trailersEndPount, query: trailersEndPount);
    print(json.toString());
    TrailersModel moviesTrailer = TrailersModel.fromJson(json);
    //Results results = Results.fromJson(json);
    return moviesTrailer;
  }

}
