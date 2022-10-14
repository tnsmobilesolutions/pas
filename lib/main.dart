// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/screen/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = "Prabasi Anchalika Sangha";
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
          // brightness: Brightness.light,
          primaryColor: Colors.deepPurple,
          scaffoldBackgroundColor: const Color(0xFFf6f6f6),
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFFf6f6f6)),
          fontFamily: 'Georgia',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFfa6e0f)),
          ))),
      home: LoginPage(
        title: appName,
      ),
    );
  }
}
