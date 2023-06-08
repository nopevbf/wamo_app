part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  const PromoCard({Key? key, required this.promo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        promo.title,
                        style: whiteTextFont.copyWith(fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      promo.subtitle,
                      style: whiteTextFont.copyWith(
                          fontSize: 11, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'OFF ',
                      style: yellowNumberFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '${promo.discount}%',
                      style: yellowNumberFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            )),
        ShaderMask(
          shaderCallback: (rectangle) {
            return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black.withOpacity(0.2), Colors.transparent])
                .createShader(const Rect.fromLTRB(0, 0, 0, 80));
          },
          child: SizedBox(
            height: 80,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: Image.asset(
                'assets/reflection2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
