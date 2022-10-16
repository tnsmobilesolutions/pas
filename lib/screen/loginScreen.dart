import 'package:authentication/EmailLogin/authenticationWidget.dart';

import 'package:flutter/material.dart';
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
      body: Center(
        child: Container(
          child: AuthenticationWidget(
            buttonColor: const Color(0xFFfa6e0f),
            cardElevation: 200,
            scaffoldbackGroundColor: const Color(0xFFf6f6f6),
            cardColor: const Color(0xFFfefefe),
            isSignUpVisible: true,
            phoneAuthentication: false,
            onEmailLoginPressed: (useremail, userpassword) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeWidget(),
                  ));
            },
            image: const AssetImage('assets/images/loginImage.png'),
            isImageVisible: false,
            onSignUpPressed: (userModel) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CompleteProfile(),
                  ));
            },
            // additionalWidget: Column(
            //   children: [
            //     TextFormField(
            //         decoration: const InputDecoration(
            //             icon: Icon(Icons.water_rounded),
            //             labelText: "Blood Group")),
            //     TextFormField(
            //         decoration: const InputDecoration(
            //             icon: Icon(Icons.home), labelText: "Sangha")),
            //     TextFormField(
            //         decoration: const InputDecoration(
            //             icon: Icon(Icons.location_city_rounded),
            //             labelText: "City")),
            //     TextFormField(
            //         decoration: const InputDecoration(
            //             icon: Icon(Icons.work), labelText: "Profession")),
            //     const SizedBox(height: 30),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
