part of 'pages.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // note: HEADER
        Container(
          decoration: BoxDecoration(
              color: mainColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          padding:
              const EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
                if(userState is UserLoaded){
                  if(imageFileToUpload != null){
                    uploadImage(imageFileToUpload!).then((downloadURL) {
                      imageFileToUpload = null;
                      context.read<UserBloc>().add(UpdateData(profileImage: downloadURL));
                    });
                  }
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: accentColor1, width: 1)),
                      child: Stack(
                        children: [
                          SpinKitFadingCircle(
                            color: accentColor1,
                            size: 50,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: (userState.users.profilePicture == '')
                                      ? const AssetImage('assets/user_pic.png')
                                      : NetworkImage(
                                              userState.users.profilePicture)
                                          as ImageProvider<Object>,
                                  fit: BoxFit.cover,
                                )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              78,
                          child: Text(userState.users.name,
                              style: whiteTextFont.copyWith(fontSize: 18, color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.clip),
                        ),
                        Text(
                            NumberFormat.currency(
                                    locale: 'id_ID',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(userState.users.balance),
                            style: blackNumberFont.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white))
                      ],
                    ),
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
