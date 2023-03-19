part of 'services.dart';

class UserServices {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(Users user) async {
    String genres = "";
    for (var genre in user.selectedGenres) {
      genres += genre + ((genre != user.selectedGenres.last) ? "," : "");
    }

    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': genres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture
    });
  }

  static Future<Users> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return Users(id, snapshot.get('email'),
        name: snapshot.get('name'),
        balance: snapshot.get('balance'),
        selectedGenres:
            (snapshot.get('selectedGenres') as String).split(',').toList(),
        selectedLanguage: snapshot.get('selectedLanguage'),
        profilePicture: snapshot.get('profilePicture'));
  }
}
