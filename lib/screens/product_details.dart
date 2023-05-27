import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/screens/ordered.dart';
import 'package:food/widgets/colors.dart';
import 'package:food/widgets/size.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

import '../widgets/customs.dart';

class poroduct_details extends StatefulWidget {
  String img;
  String price;
  String foodname;
  String rev;
  poroduct_details({
    super.key,
    required this.img,
    required this.price,
    required this.foodname,
    required this.rev,
  });

  @override
  State<poroduct_details> createState() => _poroduct_detailsState();
}

class _poroduct_detailsState extends State<poroduct_details> {
  List<String> dit = [
    '400',
    '510',
    '30',
    '56',
    '24',
  ];

  List<String> dcl = [
    'kcl',
    'grams',
    'protines',
    'carbs',
    'fats',
  ];

  int count = 1;

  String totalPrice() {
    String sum;
    return sum = widget.price.toString() * count;
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SafeArea(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                      // color: Color(0xffFAFAFA),
                      color: Color(0xffDCDCE4),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            blurRadius: 7.0),
                      ],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(200),
                          bottomLeft: Radius.circular(200))),
                  child: Stack(children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: IconButton(
                          onPressed: (() {
                            Get.back();
                          }),
                          icon: Icon(Icons.arrow_back)),
                    ),
                    Center(child: Image.asset(widget.img))
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7.0,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.star_lefthalf_fill,
                        size: 16,
                        color: Colors.amber,
                      ),
                      Text(widget.rev),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.foodname,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.price,
                  style: TextStyle(color: Color(0xffFF4F00), fontSize: 24),
                ),
              ],
            ),
          ),
          spaceh(),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: const Text(
              "You won't skip the most important meal of the"
              "\nday with this avocado toast recipe. Crispy"
              "lacy \neggs and creamy avocado top hot buttered\ntoast.",
              style: TextStyle(fontSize: 14, color: Color(0xff636363)),
            ),
          ),
          spaceh(),
          Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(0, 1), blurRadius: 1.0),
              ], color: kWhite, borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dcl.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return kcl(
                        height: MediaQuery.of(context).size.height * 0.1,
                        weight: MediaQuery.of(context).size.width * 0.15,
                        dint: dit[index],
                        dkcl: dcl[index]);
                  })),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26),
                          topRight: Radius.circular(26))),
                ),
                Row(
                  children: [
                    spacebet(),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Color(0xffF6F6F9),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (count > 1) {
                                  count--;
                                }
                              });
                            },
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 40, color: Color(0xffDCDCE4)),
                            ),
                          ),
                          Text("$count"),
                          InkWell(
                            onTap: () {
                              setState(() {
                                count++;
                              });
                            },
                            child: Text(
                              "+",
                              style: TextStyle(fontSize: 40, color: kgrey),
                            ),
                          )
                        ],
                      ),
                    ),
                    spacebet(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          color: korange,
                          borderRadius: BorderRadius.circular(20)),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ordered(pay: widget.price));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Add to order",
                              style: TextStyle(fontSize: 16, color: kWhite),
                            ),
                            Text(
                              totalPrice(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: kWhite,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
