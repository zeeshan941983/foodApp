import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/Auth/login_signin.dart/login.dart';
import 'package:food/Auth/login_phone/login_with_phone.dart';
import 'package:food/widgets/colors.dart';
import 'package:food/widgets/customs.dart';
import 'package:get/route_manager.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final signUpnameController = TextEditingController();
  final signUpemailController = TextEditingController();
  final singUppassController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref("User data");

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool loading = false;
  bool eyetru = true;
  String ErrorMessage = '';

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          body: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.4,
                    width: size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/foodbg.png"))),
                  ),
                  SizedBox(
                      width: size.width * 0.9,
                      child: TextFormField(
                        controller: signUpnameController,
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: korange)),
                            hintText: "Enter Name",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: korange,
                            ),
                            suffixStyle: const TextStyle(color: Colors.green)),
                      )),
                  spaceh(),
                  SizedBox(
                      width: size.width * 0.9,
                      child: TextFormField(
                        controller: signUpemailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: korange)),
                            hintText: "Enter Email",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: korange,
                            ),
                            suffixStyle: const TextStyle(color: Colors.green)),
                        validator: validateEmail,
                      )),
                  spaceh(),
                  SizedBox(
                      width: size.width * 0.9,
                      child: TextFormField(
                        controller: singUppassController,
                        obscureText: eyetru,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                            hintText: 'Enter Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: korange,
                            ),
                            suffixIcon: IconButton(
                                onPressed: (() {
                                  setState(() {
                                    if (eyetru) {
                                      eyetru = false;
                                    } else {
                                      eyetru = true;
                                    }
                                  });
                                }),
                                icon: Icon(eyetru == true
                                    ? CupertinoIcons.eye_slash
                                    : Icons.remove_red_eye)),
                            suffixStyle: const TextStyle(color: Colors.green)),
                        validator: validatepass,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Text(
                        ErrorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have account?"),
                      TextButton(
                          onPressed: (() {
                            Get.to(loginS());
                          }),
                          child: Text("Login")),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      if (_key.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        try {
                          await databaseRef
                              .child(signUpnameController.text)
                              .set({
                            'Name': signUpnameController.text.toString(),
                            'Emial': signUpemailController.text,
                            'password': singUppassController.text.toString(),
                          });
                          _auth
                              .createUserWithEmailAndPassword(
                                  email: signUpemailController.text,
                                  password: singUppassController.text)
                              .then((value) {
                            Get.to(() => loginS());
                          });
                          ErrorMessage = '';
                        } on FirebaseAuthException catch (error) {
                          ErrorMessage = error.message!;
                        }
                        setState(() {
                          loading = false;
                        });
                      }
                    },
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: korange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: loading
                              ? CircularProgressIndicator(
                                  strokeWidth: 2,
                                )
                              : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(login_phone());
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: size.height * 0.06,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          "Sign In with phone",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ))),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty)
    return 'E-mail address is required';
  String pattern = r'\w+@\w+\.\w+';
  RegExp regexp = RegExp(pattern);
  if (!regexp.hasMatch(formEmail)) return 'invalid Email format ';
  return null;
}

String? validatepass(String? formpass) {
  if (formpass == null || formpass.isEmpty) return 'Password is required';
  // String pattern =
  //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  // RegExp regexp = RegExp(pattern);
  // if (!regexp.hasMatch(formpass))
  //   return '''Please must be at least 8 charactors,
  // include an uppercase letter,number and symbol.''';
  return null;
}
