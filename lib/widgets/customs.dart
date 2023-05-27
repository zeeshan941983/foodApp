import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/widgets/size.dart';

class spaceh extends StatelessWidget {
  const spaceh({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.022,
    );
  }
}

///////types of foods
class types extends StatelessWidget {
  final String text;
  final bool isselect;

  final VoidCallback ontap;

  types({
    super.key,
    required this.isselect,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isselect ? Color(0xffFF4F00) : Colors.grey[100],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 18, color: isselect ? Colors.white : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

class custCuntainer extends StatelessWidget {
  final double height;
  final double weight;
  final Color color;

  custCuntainer({
    Key? key,
    required this.height,
    required this.weight,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: weight,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black)],
            color: color,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

////////list food container

class list_cont extends StatelessWidget {
  final String img;
  final String price;
  final String foodname;
  final String review;

  const list_cont({
    Key? key,
    required this.img,
    required this.price,
    required this.foodname,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topCenter,
              scale: 3.0,
              image: AssetImage(img)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  price,
                  style: TextStyle(color: Color(0xffFF4F00)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          Text(
            foodname,
            textDirection: TextDirection.ltr,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(review),
            ],
          )
        ],
      ),
    );
  }
}

/////////////containers for tab food screen
class cCuntainer extends StatefulWidget {
  final double height;
  final double weight;
  final Color color;
  final String imgs;
  final price;
  final String foodname;
  final String review;

  cCuntainer({
    Key? key,
    required this.height,
    required this.weight,
    required this.color,
    required this.imgs,
    required this.price,
    required this.foodname,
    required this.review,
  }) : super(key: key);

  @override
  State<cCuntainer> createState() => _cCuntainerState();
}

class _cCuntainerState extends State<cCuntainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.height,
        width: widget.weight,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black)],
            color: widget.color,
            image: DecorationImage(
                image: AssetImage(
                  widget.imgs,
                ),
                alignment: Alignment.topCenter),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.price,
                    style: TextStyle(
                      color: Color(0xffFF4F00),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 350,
            ),
            Text(
              widget.foodname,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textDirection: TextDirection.ltr,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  widget.review,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

///////////////////////////details of food like kcl details
class kcl extends StatelessWidget {
  final double height;
  final double weight;
  final String dint;
  final String dkcl;
  kcl({
    Key? key,
    required this.height,
    required this.weight,
    required this.dint,
    required this.dkcl,
  }) : super(key: key);
  List<String> dit = ['400', '200', '300'];
  List<String> dcl = ['kcl', 'kcl', 'kcl'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      height: height,
      width: weight,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 5),
                child: Text(
                  dint,
                  style: TextStyle(color: Color(0xffFA5A00)),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                dkcl,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ],
      ),
    );
  }
}

////////hight
class spacebet extends StatelessWidget {
  const spacebet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
    );
  }
}
