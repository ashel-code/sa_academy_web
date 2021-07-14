// widgets from the test code
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sa_academy_web/widgets/oldWidgets.dart' as old;

import 'package:sa_academy_web/main.dart';

TextStyle navBarTextStyle =
    TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: "roboto");
double navBarHeight = 30.0;

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Main());
  }

  Widget Main() {
    return Scaffold(
      backgroundColor: Color(0xFF292929),
      body: MainStack(),
    );
  }

  Widget MainStack() {
    return Stack(children: [
      SizedBox(height: navBarHeight),
      AcademyText1(),
      Positioned(child: NavBar())
    ]);
  }

  Widget NavBar() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            decoration: BoxDecoration(color: Color(0xFF000000)),
            child: Container(
                width: 1200,
                height: navBarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 20),
                    LogoAndTextButton(),
                    Spacer(flex: 10),
                    NavBarTextButton("Академия"),
                    Spacer(flex: 10),
                    NavBarTextButton("О нас"),
                    Spacer(flex: 10),
                    NavBarTextButton("FAQ"),
                    Spacer(flex: 10),
                    NavBarTextButton("Аккаунт"),
                    Spacer(flex: 20),
                  ],
                ))));
  }

  Widget NavBarTextButton(String text) {
    return TextButton(
        onPressed: () {},
        child: Text(text, style: navBarTextStyle),
        style: ButtonStyle());
  }

  Widget LogoAndTextButton() {
    return TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/logo.png"),
              width: 20,
              height: 20,
            ),
            Text("Some Academy", style: navBarTextStyle)
          ],
        ));
  }

  Widget AcademyText1() {
    return ListView(
      children: [
        SizedBox(height: navBarHeight),
        Container(
          decoration: BoxDecoration(color: Color(0xDDffffff)),
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
        )
      ],
    );
  }
}
