import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food/widgets/colors.dart';
import 'package:food/widgets/customs.dart';
import 'package:food/extra_sscreen/extra%20screen.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/screens/product_details.dart';
import 'package:food/widgets/size.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ordered extends StatefulWidget {
  final String pay;
  const ordered({super.key, required this.pay});

  @override
  State<ordered> createState() => _orderedState();
}

class _orderedState extends State<ordered> {
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                        onPressed: (() {
                          Get.back();
                        }),
                        icon: Icon(Icons.arrow_back)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Café Jack"), Text("Your order status")],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 160),
                    height: MediaQuery.of(context).size.height * 0.050,
                    width: MediaQuery.of(context).size.width * 0.050,
                    child: IconButton(
                        onPressed: (() {}),
                        alignment: Alignment.topRight,
                        icon: Icon(Icons.sort)),
                  )
                ],
              ),
              spaceh(),
              spaceh(),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                          image: AssetImage("images/spega2.png"),
                          scale: 3.0,
                          alignment: Alignment.bottomCenter),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          Text("Your dishes are ready.",
                              style: TextStyle(
                                color: kgrey,
                                fontSize: 20,
                              )),
                          const Text(
                            "Enjoy!",
                            style: TextStyle(
                                color: korange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const spaceh(),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: 327,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order list and pricesta",
                        style: TextStyle(color: kgrey),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              spaceh(),
              spaceh(),
              spaceh(),
              spaceh(),
              spaceh(),
              spaceh(),
              spaceh(),
              spaceh(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                  ),
                  Container(
                      height: 54,
                      width: 327,
                      decoration: BoxDecoration(
                        color: korange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    icon: Icon(CupertinoIcons.check_mark),
                                    title: Text(
                                      'Your ' + widget.pay,
                                    ),
                                    content: Text(
                                        "Thank You for Paying have Good Day"));
                              });
                        },
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(" Pay  ",
                                style: TextStyle(color: kWhite, fontSize: 20)),
                            Text(
                              widget.pay,
                              style: TextStyle(
                                  color: kWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
