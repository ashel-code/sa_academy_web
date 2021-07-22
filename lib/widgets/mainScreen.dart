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
      fontSize: fontSize, color: Colors.white, fontFamily: "segoeui");
}

TextStyle lightTextStyle(double fontSize) {
  return TextStyle(
      fontSize: fontSize,
      color: Colors.white,
      fontFamily: "segoeui",
      fontWeight: FontWeight.w200);
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

double switchToMobileSize = 600;
double navBarToMobile = 1000;

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
      height: height - navBarHeight,
      decoration: BoxDecoration(
        color: Color(0x00222222),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: (width > switchToMobileSize)
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          (width > switchToMobileSize)
              ? SizedBox(height: 0)
              : SizedBox(height: 25),
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
                          text: (width > switchToMobileSize)
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
    if (width > navBarToMobile) {
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
    if (width > navBarToMobile) {
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
                  SizedBox(width: 20),
                  //  Spacer(flex: 20),
                  logoAndTextButton(),
                  SizedBox(width: 50),
                  Spacer(flex: 20),
                  aboutTextButton(),
                  SizedBox(width: 50),
                  directionsTextButton(),
                  SizedBox(width: 50),
                  selectionTextButton(),
                  SizedBox(width: 50),
                  FAQTextButton(),
                  SizedBox(width: 50),
                  contactsTextButton(),
                  SizedBox(width: 50),
                  fuckedButton(),
                  SizedBox(width: 30),
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
                duration: Duration(milliseconds: isNavBarOpened ? 100 : 350),
                child: aboutTextButton(),
              ),
              AnimatedOpacity(
                opacity: isNavBarOpened ? 1.0 : 0.0,
                duration: Duration(milliseconds: isNavBarOpened ? 150 : 300),
                child: directionsTextButton(),
              ),
              AnimatedOpacity(
                opacity: isNavBarOpened ? 1.0 : 0.0,
                duration: Duration(milliseconds: isNavBarOpened ? 200 : 250),
                child: directionsTextButton(),
              ),
              AnimatedOpacity(
                opacity: isNavBarOpened ? 1.0 : 0.0,
                duration: Duration(milliseconds: isNavBarOpened ? 250 : 200),
                child: FAQTextButton(),
              ),
              AnimatedOpacity(
                opacity: isNavBarOpened ? 1.0 : 0.0,
                duration: Duration(milliseconds: isNavBarOpened ? 300 : 150),
                child: contactsTextButton(),
              ),
              AnimatedOpacity(
                opacity: isNavBarOpened ? 1.0 : 0.0,
                duration: Duration(milliseconds: isNavBarOpened ? 350 : 100),
                child: fuckedButton(),
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
        child: Text("О курсах", style: lightTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget directionsTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("Направления", style: lightTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget selectionTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("Отбор", style: lightTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  // ignore: non_constant_identifier_names
  Widget FAQTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("FAQ", style: lightTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget academyTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("Academy", style: lightTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget contactsTextButton() {
    return TextButton(
        onPressed: () {},
        child: Text("Контакты", style: lightTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget fuckedButton() {
    return Container(
      height: 30,
      width: 190,
      decoration: BoxDecoration(
        color: Color(0xFF4772FF),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Стать участником",
          style: normalTextStyle(normalTextSize),
        ),
      ),
    );
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
          // Image(
          //   image: AssetImage("assets/images/logo.png"),
          //   width: 20,
          //   height: 20,
          // ),
          Text("Academy", style: boldTextStyle(22))
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
