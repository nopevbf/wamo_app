import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wamo_app/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage()) {
    on<PageEvent>((event, emit) {
      if (event is GoToSplashPage) {
        emit(OnSplashPage());
      } else if (event is GoToLoginPage) {
        emit(OnLoginPage());
      } else if (event is GoToMainPage) {
        emit(OnMainPage());
      } else if (event is GoToRegistPage) {
        emit(OnRegistPage(event.registData));
      } else if (event is GoToPreferencePage) {
        emit(OnPreferencePage(event.registData));
      } else if (event is GoToAccountConfirmationPage) {
        emit(OnAccountConfirmationPage(event.registData));
      } else if (event is GoToMovieDetailPage) {
        emit(OnMovieDetailPage(event.movies));
      }
    });
  }
}
