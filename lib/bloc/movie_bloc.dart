import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wamo_app/models/models.dart';
import 'package:wamo_app/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {
      if (event is FetchMovie) {
        List<Movies> movies = await MoviesServices.getMovies(1);
        emit(MovieLoaded(movies));
      }
    });
  }
}
