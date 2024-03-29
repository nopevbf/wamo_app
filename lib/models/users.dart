part of 'models.dart';

class Users extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  const Users(this.id, this.email,
      {this.name = "No Name",
      this.profilePicture = "",
      this.selectedGenres = const [],
      this.selectedLanguage = "English",
      this.balance = 1000000});

  Users copyWith({String? profilePicture}) =>
      Users(
        id,
        email,
        name: name,
        profilePicture: profilePicture ?? this.profilePicture,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
        balance: balance,
      );
  @override
  String toString() {
    return '[$id] - $name, $email';
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguage,
        balance
      ];
}
