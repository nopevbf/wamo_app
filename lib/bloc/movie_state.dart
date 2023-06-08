part of 'movie_bloc.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoaded extends MovieState {
  final List<Movies> movies;

  const MovieLoaded(this.movies);
  @override
  List<Object> get props => [];
}
