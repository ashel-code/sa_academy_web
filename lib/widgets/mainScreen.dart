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
      fontSize: fontSize, color: Colors.white, fontFamily: "menlo");
}

TextStyle boldTextStyle(double fontSize) {
  return TextStyle(
      fontSize: fontSize,
      color: Colors.white,
      fontFamily: "menlo",
      fontWeight: FontWeight.bold);
}

bool isNavBarOpened = false;
double navBarHeight = 50.0;
double navBarIndent = navBarHeight;
double menuButtonWidth = navBarHeight;

double textIndent = 70.0;

double normalTextSize = 18.0;
double navBarTextSize = 18.0;

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
      body: Stack(children: [
        content(width, height),
        Positioned(child: navBar(width, height))
      ]),
    );
  }

  Widget content(double width, height) {
    return ListView(children: [
      SizedBox(height: navBarHeight),
      coverFrame(width, height),
      aboutCources(width)
    ]);
  }

  Widget coverFrame(double width, height) {
    return Container(
      height: (width > 650) ? (height - navBarHeight) : null,
      decoration: BoxDecoration(
        color: Color(0x00222222),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            (width > 650) ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          (width > 650) ? SizedBox(height: 0) : SizedBox(height: 25),
          Container(
            width: 130 + textIndent,
            height: 32,
            decoration: BoxDecoration(
              color: Color(0xFF4772FF),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(13),
                bottomRight: Radius.circular(13),
              ),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  SizedBox(
                    width: navBarIndent,
                  ),
                  Text(
                    "онлайн-курсы",
                    style: normalTextStyle(normalTextSize),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: textIndent,
              ),
              Container(
                child: Flexible(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: ".NET academy\n",
                          style: normalTextStyle(64),
                        ),
                        TextSpan(
                          text: (width > 650)
                              ? "Бесплатная программа дополнительного образования для\nстаршеклассников по изучению языка C#\n\n"
                              : "Бесплатная программа дополнительного образования для старшеклассников по изучению языка C#\n\n",
                          style: normalTextStyle(normalTextSize),
                        ),
                        TextSpan(
                          text: "Подача заявок открыта до 31 сентября.",
                          style: TextStyle(
                            fontSize: normalTextSize,
                            color: Color(0xFF808080),
                            fontFamily: "menlo",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget aboutCources(double width) {
    if (width > 600) {
      return Container(
        child: Row(
          children: [
            Flexible(
                child: Container(
                    child: RichText(
                        text: TextSpan(children: [
              TextSpan(text: "Что за курсы?\n", style: boldTextStyle(36.0)),
              TextSpan(
                  text: "Это спецпрограмма, где ты получишь практические ",
                  style: normalTextStyle(normalTextSize)),
              TextSpan(
                  text: "навыки разработки ",
                  style: boldTextStyle(normalTextSize)),
              TextSpan(
                  text: "на языке программирования C# и ",
                  style: normalTextStyle(normalTextSize)),
              TextSpan(
                  text: "закодишь в команде ",
                  style: boldTextStyle(normalTextSize)),
              TextSpan(
                  text: "с нуля проект на пратформе .NET! ",
                  style: normalTextStyle(normalTextSize))
            ])))),
            Image(image: AssetImage("assets/images/logo.png"), height: 300)
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Container(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "Что за курсы?\n", style: boldTextStyle(36.0)),
                  TextSpan(
                      text: "Это спецпрограмма, где ты получишь практические ",
                      style: normalTextStyle(normalTextSize)),
                  TextSpan(
                      text: "навыки разработки ",
                      style: boldTextStyle(normalTextSize)),
                  TextSpan(
                      text: "на языке программирования C# и ",
                      style: normalTextStyle(normalTextSize)),
                  TextSpan(
                      text: "закодишь в команде ",
                      style: boldTextStyle(normalTextSize)),
                  TextSpan(
                      text: "с нуля проект на пратформе .NET! ",
                      style: normalTextStyle(normalTextSize))
                ],
              ),
            ),
          ),
          Center(
              child: Image(
                  image: AssetImage("assets/images/logo.png"), height: 300))
        ],
      );
    }
  }

  Widget navBar(double width, double height) {
    if (width > 600) {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(color: Color(0xFF000000)),
          child: Container(
            width: double.infinity,
            height: navBarHeight,
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 20),
                  logoAndTextButton(),
                  Spacer(flex: 10),
                  aboutTextButton(),
                  Spacer(flex: 10),
                  directionsTextButton(),
                  Spacer(flex: 10),
                  selectionTextButton(),
                  Spacer(flex: 10),
                  contactsTextButton(),
                  Spacer(flex: 20),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        height: !isNavBarOpened ? navBarHeight : height,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFF000000)),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: navBarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: menuButtonWidth),
                    Spacer(),
                    logoAndTextButton(),
                    Spacer(),
                    menuButton(height)
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: isNavBarOpened ? 1.0 : 0.0,
                duration: Duration(milliseconds: isNavBarOpened ? 100 : 400),
                child: aboutTextButton(),
              ),
              AnimatedOpacity(
                opacity: isNavBarOpened ? 1.0 : 0.0,
                duration: Duration(milliseconds: isNavBarOpened ? 200 : 300),
                child: directionsTextButton(),
              ),
              AnimatedOpacity(
                opacity: isNavBarOpened ? 1.0 : 0.0,
                duration: Duration(milliseconds: isNavBarOpened ? 300 : 200),
                child: directionsTextButton(),
              ),
              AnimatedOpacity(
                opacity: isNavBarOpened ? 1.0 : 0.0,
                duration: Duration(milliseconds: isNavBarOpened ? 400 : 100),
                child: contactsTextButton(),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget aboutTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("О нас", style: normalTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget directionsTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("Направления", style: normalTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget selectionTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("Отбор", style: normalTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  // ignore: non_constant_identifier_names
  Widget FAQTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("FAQ", style: normalTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget academyTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("Academy", style: normalTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget contactsTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("Контакты", style: normalTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget menuButton(double height) {
    return Container(
        width: menuButtonWidth,
        child: TextButton(
          onPressed: () {
            setState(() {
              isNavBarOpened = !isNavBarOpened;
            });
          },
          child: Icon(
            Icons.menu,
            color: Color(0xFFFFFFFF),
          ),
        ));
  }

  Widget logoAndTextButton() {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          Image(
            image: AssetImage("assets/images/logo.png"),
            width: 20,
            height: 20,
          ),
          Text("Some Academy", style: normalTextStyle(18))
        ],
      ),
    );
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
        Image.asset("assets/images/logo.png", fit: BoxFit.scaleDown),
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
