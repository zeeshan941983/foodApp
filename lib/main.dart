import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/screens/splash_screen.dart';

import 'package:food/widgets/colors.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: korange,
      ),
      home: Splash_screen(),
    );
  }
}
