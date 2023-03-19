import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wamo_app/bloc/user_bloc.dart';
import 'package:wamo_app/services/services.dart';
import 'package:wamo_app/ui/pages/pages.dart';

import 'bloc/page_bloc.dart';
import 'bloc/theme_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices.userStream,
        initialData: null,
        child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => PageBloc()),
              BlocProvider(create: (_) => UserBloc()),
              BlocProvider(create: (_) => ThemeBloc())
            ],
            child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (_, themeState) => MaterialApp(
                    theme: themeState.themeData,
                    // theme: ThemeData().copyWith(
                    //   scaffoldBackgroundColor: Colors.white,
                    //   colorScheme: ThemeData().colorScheme.copyWith(
                    //         primary: accentColor3,
                    //       ),
                    //   errorColor: mainColor,
                    // ),
                    debugShowCheckedModeBanner: false,
                    home: const Wrapper()))));
  }
}
