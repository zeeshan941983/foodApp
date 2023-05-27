import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/widgets/colors.dart';

///////login email field
class email_textfield extends StatelessWidget {
  final String email;

  const email_textfield({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: korange)),
          hintText: email,
          prefixIcon: const Icon(
            Icons.person,
            color: korange,
          ),
          suffixStyle: const TextStyle(color: Colors.green)),
    );
  }
}

//////////login password field
class pass_textfield extends StatefulWidget {
  const pass_textfield({super.key});

  @override
  State<pass_textfield> createState() => _log_pass_textfieldState();
}

class _log_pass_textfieldState extends State<pass_textfield> {
  bool eyetru = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: eyetru,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal)),
          hintText: 'Enter Password',
          prefixIcon: const Icon(
            Icons.lock,
            color: korange,
          ),
          suffixIcon: IconButton(
              onPressed: (() {
                setState(() {
                  if (eyetru) {
                    eyetru = false;
                  } else {
                    eyetru = true;
                  }
                });
              }),
              icon: Icon(eyetru == true
                  ? CupertinoIcons.eye_slash
                  : Icons.remove_red_eye)),
          suffixStyle: const TextStyle(color: Colors.green)),
    );
  }
}
