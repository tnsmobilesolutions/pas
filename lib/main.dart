// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/screen/loginscreen.dart';
import 'package:prabasi_anchalika_sangha/screen/signup.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );   
  }
}

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final appName = "Prabasi Anchalika Sangha";
//     // ignore: prefer_const_constructors
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: appName,
//       theme: ThemeData(
//           brightness: Brightness.light,
         
//           scaffoldBackgroundColor: Colors.white,
          
//           fontFamily: 'Georgia',
//           elevatedButtonTheme: ElevatedButtonThemeData(
//               style: ButtonStyle(
                
//             backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(232, 243, 140, 37)),
//           ))),
//       home: LoginPage(
//         title: appName,
//       ),
//     );
//   }
// }

// class LoginPage extends StatelessWidget {
//   final String title;

//   LoginPage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text("Login Page"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Center(
//                 child: Container(
//                     width: 200,
//                     height: 150,
//                     /*decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(50.0)),*/
//                     ),
//               ),
//             ),
//             const Padding(
//               //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                     hintText: 'Enter valid email id as abc@gmail.com'),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(
//                   left: 15.0, right: 15.0, top: 15, bottom: 0),
//               //padding: EdgeInsets.symmetric(horizontal: 15),
//               child: TextField(

//                 obscureText: true,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                     hintText: 'Enter secure password'),
//               ),
//             ),
            
            
//             Column(
//               children: [
//                 Container(
//                   height: 50,
//                   width: 250,
//                   decoration: BoxDecoration(
//                       color:Colors.orange, borderRadius: BorderRadius.circular(20)),
//                   child: FlatButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context, MaterialPageRoute(builder: (_) => const SignUpWidget()));
//                     },
//                     child: const Text(
//                       'Login',
//                       style: TextStyle(color: Colors.white, fontSize: 25),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 130,
//             ),
//             const Text('New User? Create Account')
//           ],
//         ),
//       ),
//     );
    // const inputDecoration =
    //     const InputDecoration(icon: Icon(Icons.person), labelText: "User ID");
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(title),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Column(
    //       children: [
    //         const SizedBox(height: 10),
    //         TextFormField(
    //           decoration: inputDecoration,
    //         ),
    //         TextFormField(
    //           decoration: const InputDecoration(
    //               icon: Icon(Icons.lock), labelText: "Password"),
    //         ),
    //         const SizedBox(height: 20),
    //         ElevatedButton(
    //           onPressed: () {},
    //           child: const Text('Sign In'),
    //         ),
    //         const SizedBox(height: 10),
    //         ElevatedButton(
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => const SignUpWidget()),
    //             );
    //           },
    //           child: const Text('Sign Up'),
    //         )
    //       ],
    //     ),
    //   ),
    // );
//   }
  
//   // ignore: non_constant_identifier_names
//   FlatButton({required Null Function() onPressed, required Text child}) {}
// }
