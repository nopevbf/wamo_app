part of 'widgets.dart';

class CreditCard extends StatelessWidget {
  final Credit credit;
  final double width;

  const CreditCard(this.credit, {this.width = 70});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                  imagesBaseUrl + "w500" + credit.profilePath,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            credit.name,
            style: blackTextFont.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
