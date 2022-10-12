// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/screen/signup.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appName = "Prabasi Anchalika Sangha";
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepPurple,
          scaffoldBackgroundColor: Color.fromARGB(235, 187, 199, 211),
          appBarTheme:
              AppBarTheme(backgroundColor: Color.fromARGB(255, 44, 14, 154)),
          fontFamily: 'Georgia',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 91, 76, 175)),
          ))),
      home: LoginPage(
        title: appName,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final String title;

  LoginPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const inputDecoration =
        const InputDecoration(icon: Icon(Icons.person), labelText: "User ID");
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              decoration: inputDecoration,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.lock), labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpWidget()),
                );
              },
              child: const Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}
