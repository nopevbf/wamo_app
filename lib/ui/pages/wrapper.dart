part of 'pages.dart';

class Warapper extends StatelessWidget {
  const Warapper({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    if (user == null) {
      if (prevPageEvent is! GoToSplashPage) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(prevPageEvent!);
      }
    } else {
      if (prevPageEvent is! GoToMainPage) {
        context.read<UserBloc>().add(LoadUser(user.uid));
        prevPageEvent = GoToMainPage();
        context.read<PageBloc>().add(prevPageEvent!);
      }
    }
    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) => (pageState is OnSplashPage)
          ? const SplashPage()
          : (pageState is OnLoginPage)
              ? const SignInPage()
              : const MainPage(),
    );
  }
}
