part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign In"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              AuthServices.signIn('firajitio+test@gmail.com', '123456789');
            },
            child: const Text("Sign In"),
          ),
        ));
  }
}
