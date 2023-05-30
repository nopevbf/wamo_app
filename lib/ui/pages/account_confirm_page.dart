part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {

  final RegistData registData;
  const AccountConfirmationPage(this.registData,{Key? key}) : super(key: key);

  @override
  State<AccountConfirmationPage> createState() => _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.read<PageBloc>().add(GoToPreferencePage(widget.registData));
        return false;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 56,
                    margin: const EdgeInsets.only(top: 20, bottom: 90),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: (){
                              context.read<PageBloc>().add(GoToPreferencePage(widget.registData));
                            },
                            child: const Icon(Icons.arrow_back, color: Colors.black,),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Confirm\nNew Account",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: (widget.registData.profileImage == null) ? const AssetImage("assets/user_pic.png") : FileImage(widget.registData.profileImage!) as ImageProvider<Object>,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 250,
                      child: Column(
                      children: <Widget>[
                        Text(
                          "Welcome",
                          style: blackTextFont.copyWith(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.registData.name,
                          style: blackTextFont.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  ),
                  const SizedBox(height: 110,),
                  (isSigningUp) ? SpinKitFadingCircle(color: mainColor, size: 45,) : SizedBox(
                    width: 250,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async{
                        setState(() {
                          isSigningUp = true;
                        });
                        imageFileToUpload = widget.registData.profileImage;
                        SignInSignUpResult result =  await AuthServices.signUp(
                          widget.registData.email,
                          widget.registData.password,
                          widget.registData.name,
                          widget.registData.selectedGenres,
                          widget.registData.selectedLanguage
                        );
                        if(result.user == null){
                          setState(() {
                            isSigningUp = false;
                          });
                          if(!mounted)  return;
                          Flushbar(
                            duration: const Duration(seconds: 4),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: mainColor,
                            message: result.message,
                          ).show(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Create My Account",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                ],
        ),
      ]),
    )));
  }
}
