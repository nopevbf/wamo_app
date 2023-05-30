part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/wamo_logo.png'))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70, bottom: 16),
                child: Text(
                  'New Experience',
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
              ),
              Text(
                'Watch a new movie much\neasier than any before',
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                height: 46,
                margin: const EdgeInsets.only(top: 70, bottom: 19),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      context
                          .read<PageBloc>()
                          .add(GoToRegistPage(RegistData()));
                    },
                    child: Text(
                      'Get Started',
                      style: whiteTextFont.copyWith(fontSize: 16),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: greyTextFont.copyWith(fontSize: 16),
                  ),
                  GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(GoToLoginPage());
                      },
                      child: Text('SignIn',
                          style: redTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w700)))
                ],
              )
            ],
          )),
    );
  }
}
