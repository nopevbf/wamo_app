part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  const Promo({
    required this.title,
    required this.subtitle,
    required this.discount,
  });

  @override
  List<Object?> get props => [title, subtitle, discount];
}

List<Promo> dummyPromos = [
  const Promo(
    title: 'Student Holiday',
    subtitle: 'Maximal only for two people',
    discount: 50,
  ),
  const Promo(
    title: 'Family Club',
    subtitle: 'Minimal for three members',
    discount: 70,
  ),
  const Promo(
    title: 'Subscription Promo',
    subtitle: 'Mininal one year subscription',
    discount: 40,
  ),
];
