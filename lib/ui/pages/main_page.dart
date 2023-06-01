part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int bottomNavBarIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

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
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },
          children: <Widget>[
            MoviePage(),
            Center(child: Text('New Movie')),
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  context.read<UserBloc>().add(const SignOut());
                  AuthServices.signOut();
                },
              ),
            )
          ],
        ),
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
              onPressed: () {
                context.read<UserBloc>().add(const SignOut());
                AuthServices.signOut();
              },
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
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: mainColor,
                unselectedItemColor: const Color(0xFFE5E5E5),
                currentIndex: bottomNavBarIndex,
                onTap: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
                    pageController.jumpToPage(index);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    label: 'New Movie',
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavBarIndex == 0)
                          ? 'assets/ic_movie.png'
                          : 'assets/ic_movie_grey.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'My Tickets',
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavBarIndex == 1)
                          ? 'assets/ic_ticket.png'
                          : 'assets/ic_ticket_grey.png'),
                    ),
                  ),
                ]),
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

