import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food/Auth/login_signin.dart/login.dart';
import 'package:food/Auth/login_signin.dart/signUp.dart';
import 'package:food/screens/product_details.dart';
import 'package:food/screens/splash_screen.dart';
import 'package:food/widgets/size.dart';
import 'package:get/get.dart';

import '../widgets/customs.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  final _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  final String empty = '';
  final bool istrue = true;
  /////types
  final List name_true = [
    [
      'All Dishes',
      true,
    ],
    [
      'Drink',
      false,
    ],
    [
      'Dessert',
      false,
    ],
  ];
  //////price list
  List<String> price = [
    '\$12.30',
    '\$10.43',
    '\$3.0',
    '\$9.0',
    '\$11.0',
    '\$3.0',
    '\$3.0',
    '\$9.0',
  ];
/////list of names
  List<String> foodname = [
    'Avocado and Egg\nToast',
    'Mix Salad with\nbeans',
    'Energy Power Bowl',
    'Curry Salmon',
    'Curry Salmon',
    'Curry Salmon',
    'Curry Salmon',
    'Curry Salmon',
  ];
  List imgList = [
    'images/f1.png',
    'images/f2.png',
    'images/f3.png',
    'images/f4.png',
    'images/f1.png',
    'images/f2.png',
    'images/f3.png',
    'images/f4.png',
  ];

  List review = [
    '3.4',
    '4.0',
    '4.6',
    '3.8',
    '3.4',
    '4.0',
    '4.6',
    '3.8',
  ];

  ////selected
  void selected(int index) {
    setState(() {
      for (int i = 0; i < name_true.length; i++) {
        name_true[i][1] = false;
      }

      name_true[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: size.height * 0.05,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (() {}),
                      icon: const FaIcon(
                        FontAwesomeIcons.locationDot,
                        size: 20,
                      )),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.,
                  // ),
                  IconButton(
                      onPressed: (() {
                        _auth.signOut().then((value) {
                          Get.to(const loginS());
                        });
                      }),
                      icon: const Icon(
                        Icons.logout_sharp,
                        size: 30,
                      )),
                ],
              ),
            ),
/////first row finished
///////2nd row start
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "We think you might enjoy \nthese specially selected dishes",
                style: TextStyle(fontSize: 20),
              ),
            ),
            /////2nd row finished
            ///////////////3rd row
            const spaceh(),

            Container(
                height: size.height * 0.06,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: name_true.length,
                  itemBuilder: (context, index) {
                    return types(
                      isselect: name_true[index][1],
                      text: name_true[index][0],
                      ontap: () {
                        selected(index);
                      },
                    );
                  },
                )),

            const spaceh(),

            // spaceh(),
            // Container(
            //     height: 250,
            //     width: double.infinity,
            //     child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: 5,
            //         itemBuilder: (context, index) {
            //           return const Padding(
            //             padding: const EdgeInsets.only(left: 15.0),
            //             child: list_cont(
            //               img: "images/f1.png",
            //               foodname: "Avocado and Egg\nToast",
            //               price: "\$12.30",
            //               review: " 4.9  (120 reviews)",
            //             ),
            //           );
            //         })),
            const spaceh(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: GridView.builder(
                    itemCount: imgList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 250,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(poroduct_details(
                            img: imgList[index],
                            price: price[index],
                            foodname: foodname[index],
                            rev: review[index],
                          ));
                        },
                        child: list_cont(
                          img: imgList[index],
                          foodname: foodname[index],
                          price: price[index],
                          review: review[index],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
