import 'dart:math';

String apiKey = 'd3b84e2e622abd29fe655e88db2d0331';

String baseApi = 'api.themoviedb.org';

String latestMovieEndPoint = '/3/movie/latest';
String popularMoviesEndPoint = '/3/movie/popular';
String topRatedMoviesEndPoint = '/3/movie/top_rated';



double roundDouble(double value, int places) {
    num mod = pow(10.0, places) as double;
    return ((value * mod).round().toDouble() / mod);
  }

