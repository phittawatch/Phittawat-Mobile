import 'package:createplan_running/Login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '/homepage/homepage.dart';

class HomePageTest extends StatelessWidget {
  const HomePageTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Somthing Went Wrong!'));
        } else if (snapshot.hasData) {
          return MyAppHome();
        } else {
          return SignInUser();
        }
      },
    );
  }
}

// class LoggedInWidget extends StatelessWidget {
//   const LoggedInWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;
//     return Container(
//       color: Colors.cyan,
//       child: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//               child: const Text(
//             "Profile",
//             style: TextStyle(fontSize: 30),
//           )),
//           CircleAvatar(
//             radius: 40,
//             backgroundImage: NetworkImage(user.photoURL!),
//           ),
//           Text('Name: ' + user.displayName!),
//           Text(user.email!),
//           TextButton(
//               onPressed: () {
//                 final provider =
//                     Provider.of<GoogleSignInProvider>(context, listen: false);
//                 provider.logout();
//               },
//               child: Text("Logout"))
//         ],
//       )),
//     );
//   }
// }
//
