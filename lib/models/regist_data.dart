part of 'models.dart';

class RegistData {
  String email;
  String password;
  String name;
  List<String> selectedGenres;
  String selectedLanguage;
  File? profileImage;

  RegistData(
      {this.email = "",
      this.password = "",
      this.name = "",
      this.selectedGenres = const [],
      this.selectedLanguage = "",
      this.profileImage});
}
