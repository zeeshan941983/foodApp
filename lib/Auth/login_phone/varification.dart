import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/Auth/login_phone/login_with_phone.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/widgets/colors.dart';
import 'package:food/widgets/customs.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class varify_number extends StatefulWidget {
  final String verificationId;
  varify_number({super.key, required this.verificationId});

  @override
  State<varify_number> createState() => _varify_numberState();
}

class _varify_numberState extends State<varify_number> {
  final varifyController = TextEditingController();
  String ErrorMAssage = '';
  bool isloading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("varify phone")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          spaceh(),
          Center(
            child: SizedBox(
              width: size.width * 0.9,
              //////Login textField email&password
              child: TextField(
                controller: varifyController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: korange)),
                    labelText: "Enter 6 digit code",
                    prefixIcon: Icon(
                      Icons.lock,
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
              final criditional = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: varifyController.text.toString());
              try {
                setState(() {
                  isloading = true;
                });
                await auth.signInWithCredential(criditional).then((value) {
                  Get.to(screen1());
                });
              } catch (e) {
                setState(() {
                  ErrorMAssage = 'Somthing problem please try again';
                  isloading = false;
                });
                Get.to(login_phone());
              }
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
                            "Varify",
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
