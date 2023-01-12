import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_movies_app/models/Popular.dart';
import 'package:route_movies_app/shared/contants.dart';

import '../models/Latest.dart';

class ApiManager {
  static Future<Latest> getLatestMovie() async {
    try {
      Uri url = Uri.https(
        baseApi,
        latestMovieEndPoint,
        {
          'api_key': apiKey,
        },
      );
      var response = await http.get(url);

      var json = jsonDecode(response.body);
      Latest movie = Latest.fromJson(json);
      return movie;
    } catch (e) {
      print('----------------$e');
      throw e;
    }
  }

  static Future<Popular> getPopularMovies() async {
    try {
      Uri url = Uri.https(
        baseApi,
        popularMoviesEndPoint,
        {
          'api_key': apiKey,
        },
      );
      var response = await http.get(url);

      var json = jsonDecode(response.body);
      Popular moviesList = Popular.fromJson(json);
      print('========');
      print(moviesList.results?.length);
      return moviesList;
    } catch (e) {
      print('----------------$e');
      throw e;
    }
  }

  static Future<Popular> getTopRatedMovies() async {
    try {
      Uri url = Uri.https(
        baseApi,
        topRatedMoviesEndPoint,
        {
          'api_key': apiKey,
        },
      );
      var response = await http.get(url);

      var json = jsonDecode(response.body);
      Popular moviesList = Popular.fromJson(json);
      print('========');
      print(moviesList.results?.length);
      return moviesList;
    } catch (e) {
      print('----------------$e');
      throw e;
    }
  }
}
