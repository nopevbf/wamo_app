part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    "Action",
    "Horror",
    "Music",
    "Drama",
    "War",
    "Crime",];
  final List<String> languages = [
    "Bahasa",
    "English",
    "Japanese",
    "Korean",
    "Arabic",
    "German",];
  late final RegistData registData;
  PreferencePage(this.registData);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguages = 'English';
  bool isSigningOut = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          widget.registData.password = "";
          context.read<PageBloc>().add(GoToRegistPage(widget.registData));
          return false;
        },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Container(
                      height: 56,
                      margin: const EdgeInsets.only(top: 20, bottom: 4),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: (){
                                widget.registData.password = "";
                                context.read<PageBloc>().add(GoToRegistPage(widget.registData));
                              },
                              child: const Icon(Icons.arrow_back, color: Colors.black,),
                            ),
                          ),

                        ],
                      ),
                    ),
                  Row(
                    children: [
                      Text("Select Your\nFavorite Genre", style: blackTextFont.copyWith(fontSize: 20), textAlign: TextAlign.center,),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.5,
                      //   child: Align(
                      //     alignment: Alignment.centerRight,
                      //     child: GestureDetector(
                      //       onTap: (){
                      //         widget.registData.password = "";
                      //         context.read<PageBloc>().add(GoToRegistPage(widget.registData));
                      //       },
                      //       child: Text("Skip", style: blackTextFont.copyWith(fontSize: 16, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateGenreWidgets(context),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text("Movie Language\nYou Prefer?", style: blackTextFont.copyWith(fontSize: 20), textAlign: TextAlign.center,),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateLanguageWidgets(context),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: mainColor,
                      child: const Icon(Icons.arrow_forward, color: Colors.white,),
                      onPressed: (){
                        if(selectedGenres.length != 4){
                          Flushbar(
                            duration: const Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: mainColor,
                            message: "Please select 4 genres",
                          ).show(context);
                        } else {
                          widget.registData.selectedGenres = selectedGenres;
                          widget.registData.selectedLanguage = selectedLanguages;
                          context.read<PageBloc>().add(GoToAccountConfirmationPage(widget.registData));
                        }
                      },
                    )
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ]
          ),
        ),

      ),
    );
  }

  List <Widget> generateGenreWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;
    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenres.contains(e),
              onTap: () {
                onSelectGenre(e);
              },
            ))
        .toList();
  }

  void onSelectGenre(String e) {
    if (selectedGenres.contains(e)) {
      setState(() {
        selectedGenres.remove(e);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(e);
        });
      }
    }
  }

  //New List generateLanguageWidgets
  List <Widget> generateLanguageWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;
    return List.generate(widget.languages.length, (index) => SelectableBox(
      widget.languages[index],
      width: width,
      isSelected: selectedLanguages == widget.languages[index],
      onTap: (){
        setState(() {
          selectedLanguages = widget.languages[index];
        });
      },
    ));
  }
}