part of 'pages.dart';

class Warapper extends StatelessWidget {
  const Warapper({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    if (user == null) {
      return const SIgnInPage();
    } else {
      return const MainPage();
    }
  }
}
