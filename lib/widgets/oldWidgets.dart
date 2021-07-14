// widgets from the test code
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:sa_academy_web/main.dart';

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/code.jpg"), fit: BoxFit.cover),
          ),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: AcademyText1())),
    ));
  }

// ignore: non_constant_identifier_names
  Widget AcademyText1() {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(color: Color(0xDDffffff)),
          child: EmailForm(),
        ),
        AutoSizeText(
          "Student Ambassadors Academy",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xffffffff), fontSize: 100),
        ),
        Image.asset("assets/logo.png", fit: BoxFit.scaleDown),
        SelectableText(
          "qwerty -- some text some text some text some texttext some text some text somsome text some text some text some texttext some text some text somsome text some text some text some texttext some text some text somsome text some text some text some texttext some text some text somsome text some text some text some texttext some text some text some text",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 18,
              backgroundColor: Color(0xBB000000)),
        ),
        GridOfText()
      ],
    );
  }

  Widget GridOfText() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: <Widget>[
        SelectableText("text1"),
        Container(
            decoration: BoxDecoration(color: Color(0xff000000)),
            child: AutoSizeText("text2",
                style: TextStyle(color: Color(0xffffffff), fontSize: 30))),
        Text(
          "email: $email",
          style: TextStyle(color: Color(0xFFffffff)),
        ),
        Text("text4"),
        Text("text5"),
        Text("text6"),
      ],
    );
  }

// ignore: non_constant_identifier_names
  Widget EmailForm() {
    return Form(
        autovalidateMode: validate,
        key: key,
        child: Column(children: [
          TextFormField(
            validator: ValidateEmail,
            onSaved: (String? value) {
              setState(() {
                email = value;
              });
            },
            decoration: const InputDecoration(labelText: "email"),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              SendEmailToServer(email!);
            },
            child: Text("Send"),
          ),
          SizedBox(height: 20)
        ]));
  }

  String? ValidateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value!.length == 0) {
      return "Email is required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalide Email";
    } else {
      return null;
    }
  }

  SendEmailToServer(String value) {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      print("Email $email");
    } else {
      setState(() {
        validate = AutovalidateMode.always;
      });
    }
  }
}
