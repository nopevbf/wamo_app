part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: mainColor,
        ),
        SafeArea(
          child: Container(
            color: const Color(0xFFF6F7F9),
          ),
        ),
        ListView(),
        customButtomNavBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 46,
            width: 46,
            margin: const EdgeInsets.only(bottom: 42),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: mainColor,
              onPressed: () {},
              child: SizedBox(
                height: 26,
                width: 26,
                child: Icon(
                  MdiIcons.walletPlus,
                  color: Colors.black.withOpacity(0.50),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget customButtomNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          )),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2 - 30, 0);
    path.quadraticBezierTo(size.width / 2 - 30, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 30, 33, size.width / 2 + 30, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
