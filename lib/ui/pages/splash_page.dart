part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Page"),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("Go To SignIn Page"),
        onPressed: () {
          context.read<PageBloc>().add(GoToLoginPage());
        },
      )),
    );
  }
}
