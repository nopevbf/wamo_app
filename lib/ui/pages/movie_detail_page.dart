part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final Movies movie;

  const MovieDetailPage(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    MovieDetail? movieDetail;
    List<Credit>? credits;
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());
        return false;
      },
      child: Scaffold(
        body: FutureBuilder(
          future: MovieServices.getDetails(movie),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              movieDetail = snapshot.data;
              return FutureBuilder(
                  future: MovieServices.getCredits(movie.id),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      credits = snapshot.data;
                      return Column(children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 270,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${imagesBaseUrl}w1280${movie.backdropPath}"),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              height: 271,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: const Alignment(0, 1),
                                      end: const Alignment(0, 0.06),
                                      colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(0)
                                  ])),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: defaultTopArrow, left: defaultMargin),
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.04)),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<PageBloc>().add(GoToMainPage());
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          movieDetail!.title,
                          textAlign: TextAlign.center,
                          style: blackTextFont.copyWith(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          movieDetail!.genresAndLanguage,
                          style: greyTextFont.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RatingStars(
                              voteAverage: movie.voteAverage,
                              color: accentColor3,
                            ),
                            Text(
                              "${movie.voteAverage}/10",
                              style: greyTextFont.copyWith(fontSize: 12),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(
                              defaultMargin, 16, defaultMargin, 6),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Cast & Crew",
                              style: blackTextFont.copyWith(fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 115,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: credits!.length,
                              itemBuilder: (_, index) => Container(
                                    margin: EdgeInsets.only(
                                        left: (index == 0) ? defaultMargin : 0,
                                        right: (index == credits!.length - 1)
                                            ? defaultMargin
                                            : 16),
                                    child: CreditCard(credits![index]),
                                  )),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(
                              defaultMargin, 6, defaultMargin, 6),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Storyline",
                              style: blackTextFont.copyWith(fontSize: 14),
                            ),
                          ),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(
                                defaultMargin, 0, defaultMargin, 16),
                            child: Text(
                              movie.overview,
                              style: greyTextFont.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                        )),
                        Container(
                          height: 45,
                          width: 250,
                          margin: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Text(
                              "Continue to Book",
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        // Container(
                        //   margin: const EdgeInsets.fromLTRB(
                        //       defaultMargin, 16, defaultMargin, 6),
                        //   child: Align(
                        //     alignment: Alignment.topLeft,
                        //     child: Text(
                        //       "Storyline",
                        //       style: blackTextFont.copyWith(fontSize: 14),
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   margin: const EdgeInsets.fromLTRB(
                        //       defaultMargin, 0, defaultMargin, 30),
                        //   child: Text(
                        //     movie.overview,
                        //     style: greyTextFont.copyWith(
                        //         fontSize: 14, fontWeight: FontWeight.w400),
                        //   ),
                        // ),
                        // Container(
                        //   height: 45,
                        //   width: 250,
                        //   margin: const EdgeInsets.symmetric(
                        //       horizontal: defaultMargin),
                        //   child: ElevatedButton(
                        //     onPressed: () {},
                        //     style: ElevatedButton.styleFrom(
                        //         backgroundColor: mainColor,
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius:
                        //                 BorderRadius.circular(8))),
                        //     child: Text(
                        //       "Continue to Book",
                        //       style: whiteTextFont.copyWith(fontSize: 16),
                        //     ),
                        //   ),
                        // ),
                      ]);
                    } else {
                      return const SizedBox();
                    }
                  });
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
