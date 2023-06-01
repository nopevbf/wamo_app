part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  final Movies movies;
  final Function onTap;

  MovieCard(this.movies, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage("${imagesBaseUrl}w780${movies.posterPath}"),
              fit: BoxFit.cover)),
      child: Container(
        height: 140,
        width: 210,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.80),
                  Colors.black.withOpacity(0)
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movies.title,
              style: whiteTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            RatingStars(
              voteAverage: movies.voteAverage,
              color: accentColor3,
            )
          ],
        ),
      ),
    );
  }
}

class ComingSoonCard extends StatelessWidget {
  final Movies movies;

  const ComingSoonCard(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage("${imagesBaseUrl}w500${movies.posterPath}"),
              fit: BoxFit.cover)),
    );
  }
}
