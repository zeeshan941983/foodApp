import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/Auth/login_signin.dart/login.dart';
import 'package:food/widgets/colors.dart';
import 'package:food/widgets/customs.dart';
import 'package:get/get.dart';

class forget_Password extends StatefulWidget {
  const forget_Password({super.key});

  @override
  State<forget_Password> createState() => _forget_PasswordState();
}

class _forget_PasswordState extends State<forget_Password> {
  final Pemailcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.9,
              child: TextField(
                controller: Pemailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: korange)),
                    hintText: 'Enter Email',
                    prefixIcon: Icon(
                      Icons.person,
                      color: korange,
                    ),
                    suffixStyle: TextStyle(color: Colors.green)),
              ),
            ),
            spaceh(),
            InkWell(
              onTap: () {
                setState(() {
                  isloading = true;
                });
                auth
                    .sendPasswordResetEmail(
                        email: Pemailcontroller.text.toString())
                    .then((value) {
                  print("Check email we have sent link to your email");
                  Get.to(loginS());
                }).onError((error, stackTrace) {
                  print("something problem");
                });
              },
              child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: korange, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: isloading
                          ? CircularProgressIndicator()
                          : Text(
                              "Send Link to Email",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ))),
            )
          ],
        ),
      ),
    );
  }
}
