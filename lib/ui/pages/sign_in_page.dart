part of 'pages.dart';

class SIgnInPage extends StatefulWidget {
  const SIgnInPage({super.key});

  @override
  State<SIgnInPage> createState() => _SIgnInPageState();
}

class _SIgnInPageState extends State<SIgnInPage> {
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
