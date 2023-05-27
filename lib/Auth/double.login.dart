// import 'dart:math';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'package:food/screens/home_screen.dart';
// import 'package:food/screens/startscreen.dart';
// import 'package:food/widgets/colors.dart';
// import 'package:food/widgets/customs.dart';
// import 'package:food/widgets/login_customs.dart';
// import 'package:food/widgets/toastMsg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/route_manager.dart';

// class login_screen extends StatefulWidget {
//   const login_screen({super.key});

//   @override
//   State<login_screen> createState() => _login_screenState();
// }

// class _login_screenState extends State<login_screen> {
//   bool eyetru = true;

//   final emailcontroller = TextEditingController();
//   final passwordcontroller = TextEditingController();
//   final signUpnameController = TextEditingController();
//   final signUpemailController = TextEditingController();
//   final singUppassController = TextEditingController();
//   final GlobalKey<FormState> _key = GlobalKey<FormState>();
//   bool loading = false;

//   FirebaseAuth _auth = FirebaseAuth.instance;
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     emailcontroller.dispose();
//     passwordcontroller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return WillPopScope(
//       onWillPop: () async {
//         SystemNavigator.pop();
//         return true;
//       },
//       child: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           body: SafeArea(
//             child: Column(
//               children: [
//                 Container(
//                   height: size.height * 0.3,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage("images/foodbg.png"))),
//                 ),
//                 Container(
//                   height: size.height * 0.09,
//                   width: size.width / 1.8,
//                   child: TabBar(
//                       unselectedLabelColor: Colors.grey,
//                       labelColor: korange,
//                       labelStyle:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                       indicator: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           color: Colors.transparent),
//                       tabs: const [
//                         Tab(
//                           text: 'Sign In',
//                         ),
//                         Tab(
//                           text: 'Sign Up',
//                         ),
//                       ]),
//                 ),
//                 spaceh(),
//                 Expanded(
//                     child: TabBarView(
//                   children: [
//                     SingleChildScrollView(
//                       child: Form(
//                         key: _key,
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               width: size.width * 0.9,
//                               //////Login textField email&password
//                               child: TextFormField(
//                                 controller: emailcontroller,
//                                 keyboardType: TextInputType.emailAddress,
//                                 decoration: InputDecoration(
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(color: korange)),
//                                     hintText: 'Email',
//                                     prefixIcon: Icon(
//                                       Icons.person,
//                                       color: korange,
//                                     ),
//                                     suffixStyle:
//                                         TextStyle(color: Colors.green)),
//                                 validator: validateEmail,
//                               ),
//                             ),
//                             spaceh(),
//                             SizedBox(
//                               width: size.width * 0.9,
//                               child: TextFormField(
//                                 obscureText: eyetru,
//                                 decoration: InputDecoration(
//                                     border: const OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.teal)),
//                                     hintText: 'Enter Password',
//                                     prefixIcon: const Icon(
//                                       Icons.lock,
//                                       color: korange,
//                                     ),
//                                     suffixIcon: IconButton(
//                                         onPressed: (() {
//                                           setState(() {
//                                             if (eyetru) {
//                                               eyetru = false;
//                                             } else {
//                                               eyetru = true;
//                                             }
//                                           });
//                                         }),
//                                         icon: Icon(eyetru == true
//                                             ? CupertinoIcons.eye_slash
//                                             : Icons.remove_red_eye)),
//                                     suffixStyle:
//                                         const TextStyle(color: Colors.green)),
//                                 validator: validatepass,
//                               ),
//                             ),
//                             spaceh(),
//                             InkWell(
//                               onTap: () async {
//                                 if (_key.currentState!.validate()) {
//                                   await _auth.signInWithEmailAndPassword(
//                                       email: emailcontroller.text,
//                                       password: passwordcontroller.text);
//                                 }
//                               },
//                               child: Container(
//                                 height: size.height * 0.08,
//                                 width: size.width * 0.4,
//                                 decoration: BoxDecoration(
//                                     color: korange,
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: Center(
//                                     child: Text(
//                                   "Sign In",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 )),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     //////singup textField email&password,Name
//                     Form(
//                       key: _key,
//                       child: Column(
//                         children: [
//                           SizedBox(
//                               width: size.width * 0.9,
//                               child: TextFormField(
//                                 controller: signUpemailController,
//                                 decoration: new InputDecoration(
//                                     border: new OutlineInputBorder(
//                                         borderSide:
//                                             new BorderSide(color: korange)),
//                                     hintText: "Enter Name",
//                                     prefixIcon: const Icon(
//                                       Icons.person,
//                                       color: korange,
//                                     ),
//                                     suffixStyle:
//                                         const TextStyle(color: Colors.green)),
//                               )),
//                           spaceh(),
//                           SizedBox(
//                               width: size.width * 0.9,
//                               child: TextFormField(
//                                 controller: signUpemailController,
//                                 decoration: new InputDecoration(
//                                     border: new OutlineInputBorder(
//                                         borderSide:
//                                             new BorderSide(color: korange)),
//                                     hintText: "Enter Email",
//                                     prefixIcon: const Icon(
//                                       Icons.person,
//                                       color: korange,
//                                     ),
//                                     suffixStyle:
//                                         const TextStyle(color: Colors.green)),
//                               )),
//                           spaceh(),
//                           SizedBox(
//                               width: size.width * 0.9,
//                               child: TextFormField(
//                                 controller: singUppassController,
//                                 obscureText: eyetru,
//                                 decoration: InputDecoration(
//                                     border: const OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.teal)),
//                                     hintText: 'Enter Password',
//                                     prefixIcon: const Icon(
//                                       Icons.lock,
//                                       color: korange,
//                                     ),
//                                     suffixIcon: IconButton(
//                                         onPressed: (() {
//                                           setState(() {
//                                             if (eyetru) {
//                                               eyetru = false;
//                                             } else {
//                                               eyetru = true;
//                                             }
//                                           });
//                                         }),
//                                         icon: Icon(eyetru == true
//                                             ? CupertinoIcons.eye_slash
//                                             : Icons.remove_red_eye)),
//                                     suffixStyle:
//                                         const TextStyle(color: Colors.green)),
//                               )),
//                           spaceh(),
//                           InkWell(
//                             onTap: () async {
//                               await _auth.createUserWithEmailAndPassword(
//                                   email: signUpemailController.text,
//                                   password: singUppassController.text);

//                               setState(() {
//                                 loading = true;
//                               });
//                             },
//                             child: Container(
//                               height: size.height * 0.08,
//                               width: size.width * 0.4,
//                               decoration: BoxDecoration(
//                                   color: korange,
//                                   borderRadius: BorderRadius.circular(20)),
//                               child: Center(
//                                   child: loading
//                                       ? CircularProgressIndicator(
//                                           strokeWidth: 2,
//                                         )
//                                       : Text(
//                                           "Sign Up",
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 20),
//                                         )),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// String? validateEmail(String? formEmail) {
//   if (formEmail == null || formEmail.isEmpty)
//     return 'E-mail address is required';
//   String pattern = r'\w+@\w+\.\w+';
//   RegExp regexp = RegExp(pattern);
//   if (!regexp.hasMatch(formEmail)) return 'invalid Email format ';
//   return null;
// }

// String? validatepass(String? formpass) {
//   if (formpass == null || formpass.isEmpty) return 'Password is required';
//   // String pattern = ;
//   // RegExp regexp = RegExp(pattern);
//   // if (!regexp.hasMatch(formpass)) return 'invalid Email format ';
//   return null;
// }
