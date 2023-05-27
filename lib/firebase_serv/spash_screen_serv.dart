// import 'dart:async';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/Auth/login_signin.dart/login.dart';
import 'package:food/Auth/login_signin.dart/signUp.dart';
import 'package:food/extra_sscreen/extra%20screen.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/screens/splash_screen.dart';
import 'package:food/screens/startscreen.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';

class Splash_services {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 3), () => Get.to(() => screen1()));
    } else {
      Timer(const Duration(seconds: 3), () => Get.to(() => loginS()));
    }
  }
}
// class mainPage extends StatelessWidget {
//   const mainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return start_screen();
//           } else {
//             return Splash_screen();
//           }
//         },
//       ),
//     );
//   }
// }
