part of 'models.dart';

class Credit extends Equatable {
  final String name;
  final String profilePath;
  final String character;

  const Credit(
      {required this.name,
      required this.profilePath,
      required this.character});

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
      name: json['name'],
      profilePath: json['profile_path'],
      character: json['character']);

  @override
  List<Object?> get props => [name, profilePath, character];
}