part of 'services.dart';

class MovieServices {
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

  static Future<MovieDetail> getDetails(Movies movies,
      {http.Client? client}) async {
    String url =
        'https://api.themoviedb.org/3/movie/${movies.id}?api_key=$apiKey&language=en-US';
    client ??= http.Client();

    var response = await client.get(Uri.parse(url));
    var data = json.decode(response.body);

    List genres = (data as Map<String, dynamic>)['genres'];
    String language;

    switch ((data)['original_language'].toString()) {
      case 'ja':
        language = 'Japanese';
        break;
      case 'id':
        language = 'Indonesian';
        break;
      case 'ko':
        language = 'Korean';
        break;
      case 'en':
        language = 'English';
        break;
      default:
        language = 'Unknown';
    }

    return MovieDetail(movies,
        genres: genres.map((e) => e['name'].toString()).toList(),
        language: language);
  }

  static Future<List<Credit>> getCredits(int movieId,
      {http.Client? client}) async {
    String url =
        'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey';
    client ??= http.Client();

    var response = await client.get(Uri.parse(url));
    var data = json.decode(response.body);

    return ((data as Map<String, dynamic>)['cast'] as Iterable)
        .map((e) => Credit(
            name: e['name'],
            profilePath: e['profile_path'],
            character: e['character']))
        .take(8)
        .toList();
  }
}
