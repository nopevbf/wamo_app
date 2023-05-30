part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final String id;

  const LoadUser(this.id);

  @override
  List<Object> get props => [id];
}

class SignOut extends UserEvent {
  const SignOut();
}

class UpdateData extends UserEvent {
  final String profileImage;

  const UpdateData({this.profileImage = ''});

  @override
  List<Object> get props => [profileImage];
}
