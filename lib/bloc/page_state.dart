part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistPage extends PageState {
  final RegistData registData;

  const OnRegistPage(this.registData);

  @override
  List<Object> get props => [registData];
}

class OnPreferencePage extends PageState {
  final RegistData registData;

  const OnPreferencePage(this.registData);

  @override
  List<Object> get props => [registData];
}

class OnAccountConfirmationPage extends PageState {
  final RegistData registData;

  const OnAccountConfirmationPage(this.registData);

  @override
  List<Object> get props => [registData];
}

class OnMovieDetailPage extends PageState {
  final Movies movies;

  const OnMovieDetailPage(this.movies);

  @override
  List<Object> get props => [movies];
}
