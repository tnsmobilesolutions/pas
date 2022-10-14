import 'package:authentication/EmailLogin/authenticationWidget.dart';
import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/screen/homescreen.dart';

class LoginPage extends StatelessWidget {
  final String title;

  LoginPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: SafeArea(
        child: AuthenticationWidget(
          scaffoldbackGroundColor: Color(0xFFf6f6f6),
          isSignUpVisible: true,
          phoneAuthentication: false,
          onEmailLoginPressed: (useremail, userpassword) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeWidget(),
                ));
          },
          isImageVisible: false,
          onSignUpPressed: () {},
        ),
      ),
    );
  }
}
