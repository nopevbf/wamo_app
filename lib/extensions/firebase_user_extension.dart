part of 'extensions.dart';

extension FirebaseUserExtension on User {
  Users convertToUser({
    String name = "No Name",
    List<String> selectedGenres = const [],
    String selectedLanguage = "English",
    int balance = 50000,
  }) =>
      Users(uid, email!,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  Future<Users> fromFireStore() async => await UserServices.getUser(uid);
}
