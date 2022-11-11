// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prabasi_anchalika_sangha/bloc/profile/profile_bloc.dart';
import 'package:prabasi_anchalika_sangha/prod/firebase_options.dart';
import 'package:prabasi_anchalika_sangha/screen/splashScreen.dart';
import 'package:prabasi_anchalika_sangha/screen/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'pas-nsspuri',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: MaterialApp(
          title: 'PAS',
          debugShowCheckedModeBanner: false,
          theme: CurrentTheme.customTheme,
          home: SplashScreen()),
    );
  }
}
