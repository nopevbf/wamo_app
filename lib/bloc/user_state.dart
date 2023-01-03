part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final Users users;

  const UserLoaded(this.users);

  @override
  List<Object> get props => [users];
}
