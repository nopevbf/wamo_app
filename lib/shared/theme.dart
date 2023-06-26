part of 'shared.dart';

const double defaultMargin = 24;
const double defaultTopArrow = 56;

Color mainColor = const Color(0xFFAB0000);
Color accentColor1 = const Color(0xFF737373);
Color accentColor2 = const Color(0xFF3E9D9D);
Color accentColor3 = const Color(0xFFFFC51A);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor1, fontWeight: FontWeight.w500);
TextStyle blueTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor2, fontWeight: FontWeight.w500);
TextStyle redTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle yellowTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);

TextStyle blackNumberFont = GoogleFonts.openSans()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteNumberFont = GoogleFonts.openSans()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle yellowNumberFont = GoogleFonts.openSans()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);
