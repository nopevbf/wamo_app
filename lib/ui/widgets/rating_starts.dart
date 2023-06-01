part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final Color color;
  final MainAxisAlignment alignment;

  const RatingStars(
      {super.key,
      this.voteAverage = 0,
      this.starSize = 15,
      this.color = Colors.black,
      this.alignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();
    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              (index < n) ? MdiIcons.star : MdiIcons.starOutline,
              color: color,
              size: starSize,
            ));
    widgets.add(const SizedBox(
      width: 5,
    ));
    widgets.add(Text(
      "$voteAverage/10",
      style: whiteNumberFont.copyWith(
          fontWeight: FontWeight.w300, fontSize: starSize),
    ));
    return Row(
      mainAxisAlignment: alignment,
      children: widgets,
    );
  }
}
