part of 'services.dart';

class MoviesServices {
  static Future<List<Movies>> getMovies(int page, {http.Client? client}) async {
    String url =
        'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page';
    client ??= http.Client();

    var response = await client.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return [];
    }
    var data = json.decode(response.body);
    List result = data['results'];
    return result.map((e) => Movies.fromJson(e)).toList();
  }
}
