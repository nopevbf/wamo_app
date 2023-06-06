part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  const BrowseButton({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: const Color(0xFFEEF1F8),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: SizedBox(
                height: 36,
                width: 36,
                child: Image.asset('assets/ic_${genre.toLowerCase()}.png')),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          width: 70,
          child: Text(genre,
              textAlign: TextAlign.center,
              style: blackTextFont.copyWith(fontSize: 13)),
        )
      ],
    );
  }
}
