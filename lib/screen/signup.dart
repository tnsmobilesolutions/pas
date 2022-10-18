// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:prabasi_anchalika_sangha/screen/homescreen.dart';

// class SignUpWidget extends StatelessWidget {
//   const SignUpWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xFFf6f6f6),
//         appBar: AppBar(
//           backgroundColor: const Color(0xFFf6f6f6),
//           title: const Text('Sign Up'),
//           elevation: 0,
//         ),
//         body: SingleChildScrollView(
//             child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(children: [
//                   const SizedBox(height: 10),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           icon: Icon(Icons.email), labelText: "Email ID")),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           icon: Icon(Icons.phone), labelText: "Mobile Number")),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           icon: Icon(Icons.key_rounded),
//                           labelText: "Password")),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           icon: Icon(Icons.key_rounded),
//                           labelText: "Confirm Password")),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           icon: Icon(Icons.water_rounded),
//                           labelText: "Blood Group")),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           icon: Icon(Icons.home), labelText: "Sangha")),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           icon: Icon(Icons.location_city_rounded),
//                           labelText: "City")),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           icon: Icon(Icons.work), labelText: "Profession")),
//                   const SizedBox(height: 30),
//                   CupertinoButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => HomeWidget()),
//                       );
//                     },
//                     child: Row(
//                       children: const [Text('Next'), Icon(Icons.forward)],
//                     ),
//                   )
//                 ]))));
//   }
// }
