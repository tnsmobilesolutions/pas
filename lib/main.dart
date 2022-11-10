import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/dev/firebase_options.dart';
import 'package:prabasi_anchalika_sangha/screen/homescreen.dart';

import 'package:prabasi_anchalika_sangha/screen/loginscreen.dart';
import 'package:prabasi_anchalika_sangha/screen/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      theme: CurrentTheme.customTheme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;

            if (user == null) {
              return LoginPage(title: 'Prabasi Anchalika Sangha');
            } else {
              return HomeWidget();
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
