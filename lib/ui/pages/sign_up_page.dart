part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistData registData;
  const SignUpPage(this.registData, {super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.registData.name;
    emailController.text = widget.registData.email;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 22),
                      height: 56,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(GoToSplashPage());
                              },
                              child: const Icon(Icons.arrow_back,
                                  color: Colors.black),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Create New\nMy Wamo',
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          context.read<PageBloc>().add(GoToSplashPage());
          return false;
        });
  }
}
