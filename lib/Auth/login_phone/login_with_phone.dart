import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/Auth/login_phone/varification.dart';
import 'package:food/widgets/colors.dart';
import 'package:get/get.dart';

import '../../widgets/customs.dart';

class login_phone extends StatefulWidget {
  const login_phone({super.key});

  @override
  State<login_phone> createState() => _login_phoneState();
}

class _login_phoneState extends State<login_phone> {
  String ErrorMAssage = '';
  final phoneNumbercontroller = TextEditingController();
  bool isloading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Login with phone")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          spaceh(),
          Center(
            child: SizedBox(
              width: size.width * 0.9,
              //////Login textField email&password
              child: TextField(
                controller: phoneNumbercontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: korange)),
                    labelText: "+1 3142425678",
                    prefixIcon: Icon(
                      Icons.person,
                      color: korange,
                    ),
                    suffixStyle: TextStyle(color: Colors.green)),
              ),
            ),
          ),
          Text(
            ErrorMAssage,
            style: TextStyle(color: Colors.red),
          ),
          spaceh(),
          InkWell(
            onTap: () async {
              setState(() {
                isloading = true;
              });
              await auth.verifyPhoneNumber(
                  phoneNumber: phoneNumbercontroller.text,
                  verificationCompleted: (_) {},
                  verificationFailed: (e) {
                    setState(() {
                      isloading = false;
                      ErrorMAssage =
                          '''varification faild! please check phone number or
                       internet connection''';
                    });
                  },
                  codeSent: (String verificationId, int? forceResendingToken) {
                    Get.to(varify_number(
                      verificationId: verificationId,
                    ));
                  },
                  codeAutoRetrievalTimeout: (e) {
                    setState(() {
                      isloading = false;
                      ErrorMAssage = '''Time is out''';
                    });
                    print("timeout");
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
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ))),
          )
        ],
      ),
    );
  }
}
