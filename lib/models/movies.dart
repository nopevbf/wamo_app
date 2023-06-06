part of 'models.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;

  const Movies(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath,
      required this.backdropPath,
      required this.voteAverage});

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] as num).toDouble());

  @override
  List<Object?> get props =>
      [id, title, overview, posterPath, backdropPath, voteAverage];
}
