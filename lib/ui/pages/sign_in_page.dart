part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .read<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor3)));
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToSplashPage());
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 93,
                        child: Image.asset('assets/ic_wamo.png'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 55, bottom: 16),
                        child: Text(
                          'Welcome Back,\nExplorer!',
                          style: blackTextFont.copyWith(fontSize: 20),
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        onChanged: (text) {
                          setState(() {
                            isEmailValid = EmailValidator.validate(text);
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Email Address',
                            hintText: 'Email Address'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: passwordController,
                        onChanged: (text) {
                          setState(() {
                            isPasswordValid = text.length >= 6;
                          });
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Password',
                            hintText: 'Password'),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Text(
                            'Forgot Password?',
                            style: greyTextFont.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Get Now',
                            style: redTextFont.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(top: 40, bottom: 30),
                          child: isSigningIn
                              ? SpinKitFadingCircle(
                                  color: mainColor,
                                )
                              : FloatingActionButton(
                                  backgroundColor:
                                      isEmailValid && isPasswordValid
                                          ? mainColor
                                          : const Color(0xFFE4E4E4),
                                  elevation: 0,
                                  onPressed: isEmailValid && isPasswordValid
                                      ? () async {
                                          setState(() {
                                            isSigningIn = true;
                                          });

                                          SignInSignUpResult result =
                                              await AuthServices.signIn(
                                                  emailController.text,
                                                  passwordController.text);

                                          if (result.user == null) {
                                            setState(() {
                                              isSigningIn = false;
                                            });

                                            Flushbar(
                                              duration:
                                                  const Duration(seconds: 4),
                                              flushbarPosition:
                                                  FlushbarPosition.TOP,
                                              backgroundColor: mainColor,
                                              message: result.message,
                                            )..show(context);
                                          }
                                        }
                                      : null,
                                  child: const Icon(Icons.arrow_forward)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: greyTextFont.copyWith(fontSize: 16),
                          ),
                          GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(GoToSplashPage());
                              },
                              child: Text(
                                'Sign Up',
                                style: redTextFont.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ))),
    );
  }
}
