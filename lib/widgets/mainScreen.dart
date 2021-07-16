// widgets from the test code
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/rendering.dart';
import 'package:sa_academy_web/widgets/oldWidgets.dart' as old;

import 'package:sa_academy_web/main.dart';

TextStyle normalTextStyle(double fontSize) {
  return TextStyle(
      fontSize: fontSize, color: Colors.white, fontFamily: "roboto");
}

TextStyle boldTextStyle(double fontSize) {
  return TextStyle(
      fontSize: fontSize,
      color: Colors.white,
      fontFamily: "roboto",
      fontWeight: FontWeight.bold);
}

bool isNavBarOpened = false;
double navBarHeight = 30.0;
double navBarIndent = navBarHeight;

double normalTextSize = 14.0;

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Center(child: main(width, height));
  }

  Widget main(double width, height) {
    return Scaffold(
      drawer: menuButton(height),
      backgroundColor: Color(0xFF292929),
      body: Stack(
          children: [content(width), Positioned(child: navBar(width, height))]),
    );
  }

  Widget content(double width) {
    return ListView(
        children: [SizedBox(height: navBarHeight), aboutCources(width)]);
  }

  Widget aboutCources(double width) {
    if (width > 800) {
      return Container(
        child: Row(
          children: [
            Flexible(
                child: Container(
                    child: RichText(
                        text: TextSpan(children: [
              TextSpan(text: "Что за курсы?\n", style: boldTextStyle(64.0)),
              TextSpan(
                  text: "Это спецпрограмма, где ты получишь практические ",
                  style: normalTextStyle(36.0)),
              TextSpan(text: "навыки разработки ", style: boldTextStyle(36.0)),
              TextSpan(
                  text: "на языке программирования C# и ",
                  style: normalTextStyle(36.0)),
              TextSpan(text: "закодишь в команде ", style: boldTextStyle(36.0)),
              TextSpan(
                  text: "с нуля проект на пратформе .NET! ",
                  style: normalTextStyle(36.0))
            ])))),
            Image(image: AssetImage("assets/logo.png"), height: 300)
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Container(
              child: RichText(
                  text: TextSpan(children: [
            TextSpan(text: "Что за курсы?\n", style: boldTextStyle(64.0)),
            TextSpan(
                text: "Это спецпрограмма, где ты получишь практические ",
                style: normalTextStyle(36.0)),
            TextSpan(text: "навыки разработки ", style: boldTextStyle(36.0)),
            TextSpan(
                text: "на языке программирования C# и ",
                style: normalTextStyle(36.0)),
            TextSpan(text: "закодишь в команде ", style: boldTextStyle(36.0)),
            TextSpan(
                text: "с нуля проект на пратформе .NET! ",
                style: normalTextStyle(36.0))
          ]))),
          Center(
              child: Image(image: AssetImage("assets/logo.png"), height: 300))
        ],
      );
    }
  }

  Widget navBar(double width, double height) {
    if (width > 500) {
      return Align(
          alignment: Alignment.topCenter,
          child: Container(
              decoration: BoxDecoration(color: Color(0xFF000000)),
              child: Container(
                  width: double.infinity,
                  height: navBarHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex: 20),
                      logoAndTextButton(),
                      Spacer(flex: 10),
                      navBarTextButton("Академия"),
                      Spacer(flex: 10),
                      navBarTextButton("О нас"),
                      Spacer(flex: 10),
                      navBarTextButton("FAQ"),
                      Spacer(flex: 10),
                      navBarTextButton("Аккаунт"),
                      Spacer(flex: 20),
                    ],
                  ))));
    } else {
      return AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.linear,
          height: !isNavBarOpened ? navBarHeight : 300,
          decoration: BoxDecoration(color: Color(0xFF000000)),
          child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: double.infinity,
                  height: navBarHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      logoAndTextButton(),
                      Spacer(),
                      menuButton(height)
                    ],
                  ))));
    }
  }

  Widget menuButton(double height) {
    return TextButton(
        onPressed: () {
          setState(() {
            isNavBarOpened = !isNavBarOpened;
          });
        },
        child: Icon(Icons.menu, color: Color(0xFFFFFFFF)));
  }

  Widget navBarTextButton(String text) {
    return TextButton(
        onPressed: () {
          switch (text) {
            case "Академия":
              break;
            default:
          }
        },
        child: Text(text, style: normalTextStyle(14.0)),
        style: ButtonStyle());
  }

  Widget logoAndTextButton() {
    return TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/logo.png"),
              width: 20,
              height: 20,
            ),
            Text("Some Academy", style: normalTextStyle(18))
          ],
        ));
  }

  Widget academyText1() {
    return ListView(
      children: [
        SizedBox(height: navBarIndent),
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
