part of 'widgets.dart';

class ComingSoonCard extends StatelessWidget {
  final Movies movies;
  final Function onTap;

  const ComingSoonCard(this.movies, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      width: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage("${imagesBaseUrl}w500${movies.posterPath}"),
              fit: BoxFit.cover)),
    );
  }
}
