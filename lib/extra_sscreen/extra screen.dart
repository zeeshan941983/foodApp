import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/customs.dart';

class home_screent extends StatefulWidget {
  String img;
  String price;
  String foodname;
  String rev;
  home_screent({
    super.key,
    required this.img,
    required this.price,
    required this.foodname,
    required this.rev,
  });

  @override
  State<home_screent> createState() => _home_screentState();
}

class _home_screentState extends State<home_screent> {
  /////types
  final List name_true = [
    [
      'Eat',
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

  ////selected
  void selected(int index) {
    setState(() {
      for (int i = 0; i < name_true.length; i++) {
        name_true[i][1] = false;
      }
      name_true[index][1] = true;
    });
  }

  void getindex() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ////////first row
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: (() {}),
                      icon: FaIcon(
                        FontAwesomeIcons.locationDot,
                        size: 25,
                      )),
                  Text("Café Jack"),
                  SizedBox(
                    width: 220,
                  ),
                  IconButton(
                      onPressed: (() {}),
                      icon: Icon(
                        Icons.menu,
                        size: 35,
                      )),
                ],
              ),
            ),
/////first row finished
///////2nd row start
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "We think you might enjoy these \nspecially selected dishes",
                style: TextStyle(fontSize: 24),
              ),
            ),
            /////2nd row finished
            ///////////////3rd row
            spaceh(),

            Container(
                height: 60,
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
            spaceh(),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: custCuntainer(
                          height: 555, weight: 300, color: Colors.white)),
                ),
                custCuntainer(
                  height: 550,
                  weight: 350,
                  color: Colors.white,
                ),
                cCuntainer(
                  height: 500,
                  weight: 400,
                  color: Colors.white,
                  imgs: widget.img,
                  price: widget.price,
                  foodname: widget.foodname,
                  review: widget.rev,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
