// import 'package:createplan_running/Login/login_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'test_homepage.dart';
//
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//         create: (context) => GoogleSignInProvider(),
//         child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: "Nonoewpgj",
//             home: HomePageTest()),
//       );
// }
//
// class SignInUser extends StatefulWidget {
//   const SignInUser({Key? key}) : super(key: key);
//
//   @override
//   _SignInUserState createState() => _SignInUserState();
// }
//
// class _SignInUserState extends State<SignInUser> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: const Image(
//             image: AssetImage('lib/images/bg_login.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: FractionalOffset.bottomCenter,
//                   end: FractionalOffset.topCenter,
//                   colors: [
//                 Colors.black,
//                 Colors.black.withOpacity(0.6),
//                 Colors.black45.withOpacity(0.0)
//               ])),
//         ),
//         Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                   margin: const EdgeInsets.only(top: 350),
//                   child: const Text(
//                     "FITTUDE",
//                     style: TextStyle(
//                         fontSize: 56,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   )),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(20, 200, 20, 20),
//                 height: 50,
//                 width: 250,
//                 child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: const Color(0xffEF5DA8),
//                       primary: Colors.white,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15)),
//                     ),
//                     //TODO: Write OnPressed function here
//                     onPressed: () {
//                       final provider = Provider.of<GoogleSignInProvider>(
//                           context,
//                           listen: false);
//                       provider.googleLogin();
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         FaIcon(FontAwesomeIcons.google),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Text(
//                           "Log in with Google",
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     )),
//               ),
//               // RichText(
//               //   text: const TextSpan(
//               //     text: "Doesn't have an account?  ",
//               //     style: TextStyle(
//               //         color: Colors.grey, fontWeight: FontWeight.w500),
//               //     children: [
//               //       TextSpan(
//               //           text: "Sign up", style: TextStyle(color: Colors.white))
//               //     ],
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }
//
// class GoogleSignInProvider extends ChangeNotifier {
//   final googleSignIn = GoogleSignIn();
//
//   GoogleSignInAccount? _user;
//
//   GoogleSignInAccount get user => _user!;
//
//   Future googleLogin() async {
//     try {
//       final googleUser = await googleSignIn.signIn();
//       if (googleUser == null) return;
//
//       _user = googleUser;
//
//       final googleAuth = await googleUser.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//
//       notifyListeners();
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   Future logout() async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }
// }
