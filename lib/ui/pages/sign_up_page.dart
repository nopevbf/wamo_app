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
    return MaterialApp(
      builder: (context, child) {
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
                                  'Create New\nAccount',
                                  style: blackTextFont.copyWith(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 104,
                          child: Stack(
                              children: <Widget>[
                                Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: (widget.registData.profileImage == null) ? const AssetImage('assets/user_pic.png') as ImageProvider : FileImage(widget.registData.profileImage!), fit: BoxFit.cover),
                                    )
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (widget.registData.profileImage == null) {
                                        widget.registData.profileImage = await getImage();
                                      } else {
                                        widget.registData.profileImage = null;
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                        height: 28,
                                        width: 28,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(image: AssetImage((widget.registData.profileImage == null) ? 'assets/btn_add_photo.png' : 'assets/btn_del_photo.png'), fit: BoxFit.cover),
                                        )
                                    ),
                                  ),
                                )
                              ]
                          ),
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Full Name',
                              hintText: 'Full Name'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: emailController,
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
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Password',
                              hintText: 'Password'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Confirm Password',
                              hintText: 'Confirm Password'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        FloatingActionButton(
                          elevation: 0,
                          backgroundColor: mainColor,
                          child: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            if (!(nameController.text.trim() != "" &&
                                emailController.text.trim() != "" &&
                                passwordController.text.trim() != "" &&
                                confirmPasswordController.text.trim() != "")) {
                              Flushbar(
                                duration: const Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: mainColor,
                                message: 'Please fill all the fields',
                              ).show(context);
                            } else if (passwordController.text !=
                                confirmPasswordController.text) {
                              Flushbar(
                                duration: const Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: mainColor,
                                message: 'Mismatch password and confirmed password',
                              ).show(context);
                            } else if (passwordController.text.length < 6) {
                              Flushbar(
                                duration: const Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: mainColor,
                                message: 'Password\'s length min 6 characters',
                              ).show(context);
                            } else if (!EmailValidator.validate(
                                emailController.text)) {
                              Flushbar(
                                duration: const Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: mainColor,
                                message: 'Wrong formatted email address',
                              ).show(context);
                            } else {
                              widget.registData.name = nameController.text;
                              widget.registData.email = emailController.text;
                              widget.registData.password = passwordController.text;

                              //todo: Go to preference page
                              context.read<PageBloc>().add(GoToPreferencePage(widget.registData));
                            }
                          },
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
            }) ;
      },
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white, colorScheme: ThemeData().colorScheme.copyWith(
        primary: accentColor1,
      ).copyWith(error: mainColor),
      ),
    );
  }
}
