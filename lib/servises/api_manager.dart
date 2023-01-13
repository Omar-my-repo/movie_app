import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:route_movies_app/models/Popular.dart';
import 'package:route_movies_app/shared/contants.dart';

import '../models/Latest.dart';

class ApiManager {
  //generic function to get any api PATH
  static getJsonResponse(String endPoint) async {
    try {
      Uri url = Uri.https(
        baseApi,
        endPoint,
        {
          'api_key': apiKey,
        },
      );
      Response response = await http.get(url);
      var json = jsonDecode(response.body);
      return json;
    } catch (e) {
      print('---ERROR IN API MANAGER CANT GET RESPONSE:--MSG: $e');
      throw e;
    }
  }

  static Future<Latest> getLatestMovie() async {
    var json = await getJsonResponse(latestMovieEndPoint);

    Latest movie = Latest.fromJson(json);
    return movie;
  }

  static Future<Popular> getPopularMovies() async {
    var json = await getJsonResponse(popularMoviesEndPoint);
    Popular moviesList = Popular.fromJson(json);
    print('new released section movies length: ${moviesList.results?.length} ');
    return moviesList;
  }

  static Future<Popular> getTopRatedMovies() async {
    var json = await getJsonResponse(topRatedMoviesEndPoint);
    Popular moviesList = Popular.fromJson(json);
    print('recommended section movies length: ${moviesList.results?.length} ');
    return moviesList;
  }
}
