part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<UserBloc, UserState>(
              builder: (_, userState) => (userState is UserLoaded)
                  ? Text(userState.users.name)
                  : const SizedBox(),
            ),
            ElevatedButton(
                onPressed: () {
                  AuthServices.signOut();
                },
                child: const Text("Sign Out")),
          ],
        ),
      ),
    );
  }
}
