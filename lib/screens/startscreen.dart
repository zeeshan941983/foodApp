import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/widgets/colors.dart';
import 'package:food/widgets/size.dart';

import '../widgets/customs.dart';
import 'home_screen.dart';

class start_screen extends StatelessWidget {
  const start_screen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          //////background image
          Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "images/first screen2.jpeg",
            ),
          ),
        ),
        child: Stack(
          children: [
            ////////blur of image
            new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: new Container(
                  decoration: new BoxDecoration(color: kWhite.withOpacity(0.0)),
                )),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child:
                        //////text
                        Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " No Worry,",
                              style: TextStyle(
                                  color: kWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              " Handle ",
                              style: TextStyle(color: kWhite, fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " Your Hunger",
                              style: TextStyle(color: kWhite, fontSize: 18),
                            ),
                            Text(
                              " with",
                              style: TextStyle(color: kWhite, fontSize: 18),
                            ),
                          ],
                        ),
                        Text(
                          "Eattak! ",
                          style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          "Eattak come to help you hunger problem \n\t\t\t\t\t\t\t\t\twith easy find any restaurant ",
                          style: TextStyle(color: kWhite, fontSize: 17),
                        ),
                        spaceh(),
                        //////text finished
                        Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 6.8,
                              height: MediaQuery.of(context).size.width / 7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 7,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: BoxDecoration(
                                  color: Color(0xffFF4B00),
                                  borderRadius: BorderRadius.circular(30)),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => screen1()));
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 9,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
