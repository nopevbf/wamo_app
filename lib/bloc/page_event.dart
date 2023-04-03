part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistPage extends PageEvent {
  final RegistData registData;

  const GoToRegistPage(this.registData);

  @override
  List<Object> get props => [registData];
}

class GoToPreferencePage extends PageEvent {
  final RegistData registData;

  const GoToPreferencePage(this.registData);

  @override
  List<Object> get props => [registData];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistData registData;

  const GoToAccountConfirmationPage(this.registData);

  @override
  List<Object> get props => [registData];
}
