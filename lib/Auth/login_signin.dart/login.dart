import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/Auth/login_signin.dart/forgetPassword.dart';
import 'package:food/Auth/login_signin.dart/signUp.dart';
import 'package:food/screens/startscreen.dart';
import 'package:food/widgets/customs.dart';
import 'package:get/get.dart';

import '../../widgets/colors.dart';

class loginS extends StatefulWidget {
  const loginS({super.key});

  @override
  State<loginS> createState() => _loginSState();
}

class _loginSState extends State<loginS> {
  bool eyetru = true;

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  String ErrorMAssage = '';

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordcontroller.dispose();
    emailcontroller.dispose();
  }

  void login() async {
    if (_key.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      try {
        await _auth
            .signInWithEmailAndPassword(
                email: emailcontroller.text.trim(),
                password: passwordcontroller.text.trim())
            .then((value) {
          Get.to(start_screen());
        });
        ErrorMAssage = '';
      } on FirebaseAuthException catch (error) {
        ErrorMAssage = error.message!;
      }
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.4,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/foodbg.png"))),
                ),
                Form(
                  key: _key,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.9,
                          //////Login textField email&password
                          child: TextFormField(
                            controller: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: korange)),
                                hintText: 'Email',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: korange,
                                ),
                                suffixStyle: TextStyle(color: Colors.green)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Email";
                              }
                              return null;
                            },
                          ),
                        ),
                        spaceh(),
                        SizedBox(
                          width: size.width * 0.9,
                          //////Login textField email&password
                          child: TextFormField(
                            controller: passwordcontroller,
                            obscureText: eyetru,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: korange)),
                                hintText: 'Enter Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: korange,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (eyetru) {
                                        eyetru = false;
                                      } else {
                                        eyetru = true;
                                      }
                                    });
                                  },
                                  icon: eyetru
                                      ? Icon(CupertinoIcons.eye_slash)
                                      : Icon(CupertinoIcons.eye),
                                ),
                                suffixStyle: TextStyle(color: Colors.green)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter password";
                              }
                              return null;
                            },
                          ),
                        ),
                        Text(
                          ErrorMAssage,
                          style: TextStyle(color: Colors.red),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: (() {
                                  Get.to(forget_Password());
                                }),
                                child: Text("Forget password?")),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            login();
                          },
                          child: Container(
                              height: size.height * 0.06,
                              width: size.width * 0.9,
                              decoration: BoxDecoration(
                                  color: korange,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: loading
                                      ? CircularProgressIndicator()
                                      : Text(
                                          "Sign In",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Doesn't have account?"),
                            TextButton(
                                onPressed: (() => Get.to(signup())),
                                child: Text("SignUp")),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

// /////////
// String? validateEmail(String? formEmail) {
//   if (formEmail == null || formEmail.isEmpty)
//     return 'E-mail address is required';

//   return null;
// }

// String? validatepass(String? formpass) {
//   if (formpass == null || formpass.isEmpty) return 'Password is required';

//   return null;
// }
