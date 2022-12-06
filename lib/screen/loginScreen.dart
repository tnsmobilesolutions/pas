import 'package:authentication/EmailLogin/authenticationWidget.dart';

import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';
import 'package:prabasi_anchalika_sangha/screen/CompleteProfile.dart';

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
      backgroundColor: const Color(0xFFf6f6f6),
      body: SafeArea(
        child: Center(
          child: Container(
            child: AuthenticationWidget(
              buttonColor: const Color(0xFFfa6e0f),
              cardElevation: 1,
              title: 'Prabasi Anchalika Sangha',
              loginPageTextStyle:
                  TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              scaffoldbackGroundColor: const Color(0xFFf6f6f6),
              cardColor: const Color(0xFFfefefe),
              isSignUpVisible: true,
              signUpButtonText: 'Next',
              phoneAuthentication: false,
              onEmailLoginPressed: (useremail, userpassword) async {
                final user = await UserAPI().signIn(useremail, userpassword);
                if (user != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeWidget(),
                      ));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('Please Check your userEmail and Password'),
                  ),
                );
              },
              image: const AssetImage('assets/images/paslogo.png'),
              isImageVisible: true,
              imageHeight: 200,
              imageWidth: 200,
              onSignUpPressed: (email, password, name, userId, mobileNo) async {
                userModel newUser = userModel(
                  //             String? email, String? password,
                  // String? name, String? userId, String? mobile
                  email: email,
                  name: name,
                  phoneNumber: mobileNo,
                  userId: userId,
                  bloodgroup: '',
                  city: '',
                  proffesion: '',
                  sangha: '',
                  uid: '',
                );

                await UserAPI().emailSignUp(newUser, password);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CompleteProfile(),
                    ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
