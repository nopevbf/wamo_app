import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wamo_app/models/models.dart';
import 'package:wamo_app/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is LoadUser) {
        Users users = await UserServices.getUser(event.id);
        emit(UserLoaded(users));
      } else if (event is SignOut) {
        FirebaseAuth.instance.signOut();
        emit(UserInitial());
      }
    });
  }
}
