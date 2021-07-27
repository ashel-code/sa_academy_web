// widgets from the test code
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/rendering.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:sa_academy_web/widgets/oldWidgets.dart' as old;
import 'package:sa_academy_web/main.dart';

TextStyle normalTextStyle(double fontSize) {
  return TextStyle(
      fontSize: fontSize, color: Colors.white, fontFamily: "segoeui");
}

TextStyle normalBlackTextStyle(double fontSize) {
  return TextStyle(
      fontSize: fontSize, color: Colors.black, fontFamily: "segoeui");
}

TextStyle lightTextStyle(double fontSize) {
  return TextStyle(
      fontSize: fontSize,
      color: Colors.white,
      fontFamily: "segoeui",
      fontWeight: FontWeight.w200);
}

TextSpan spaceEnter = TextSpan(
  text: "\n\n",
  style: TextStyle(height: 0.5),
);

TextStyle boldTextStyle(double fontSize) {
  return TextStyle(
      fontSize: fontSize,
      color: Colors.white,
      fontFamily: "segoeui",
      fontWeight: FontWeight.w600);
}

bool isNavBarOpened = false;
double navBarHeight = 50.0;
double navBarIndent = navBarHeight;
double menuButtonWidth = navBarHeight;

double textIndent = 70.0;
double schemeIndent = 8.0;
double horizontalIndent = 20;

double switchToMobileSize = 650;
double navBarToMobile = 1000;

double normalTextSize = 18.0;
double navBarTextSize = 18.0;

double normalElevation = 5.0;

double textHeight = 48.0;
double maxWidth = 1500;
// images
// what is academy answer block
String skillsImage = "assets/images/smile.png";
String practiceImage = "assets/images/school.png";
String projectImage = "assets/images/graduation.png";
// what is academy question block
String threeGuysImage = "assets/images/three-guys.png";
// how it works block
String pencilImage = "assets/images/pencil.png";
String pontyCase = "assets/images/briefcase.png";
String notMacbook = "assets/images/pc.png";
String carrotidk = "assets/images/party-popper.png";
// directions block
String aspDirectionImage = "assets/images/school.png";
String wpfDirectionImage = "assets/images/school.png";
String xamarinDirectionImage = "assets/images/school.png";

class MyHomePageState extends State<MyHomePage> {
  // keys
  final aboutKey = new GlobalKey();
  final answersKey = new GlobalKey();
  final aboutCourcesKey = new GlobalKey();

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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: navBarHeight),
          coverFrame(width, height),
          whatIsAcademyText(),
          whatIsAcademyAnswer(width),
          united(width),
          aboutCources(width),
          learningScheme(width),
          howItWorks(width),
          directions(width)
        ],
      ),
    );
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
              gradient: LinearGradient(
                colors: [Color(0xff1E88E5), Color(0xff0060B4)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
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
                    "онлайн-курс",
                    style: normalTextStyle(normalTextSize),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: (width > switchToMobileSize)
                    ? textIndent
                    : (textIndent / 2),
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
              SizedBox(
                width: (width > switchToMobileSize) ? 0 : (textIndent / 2),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget united(double width) {
    return Stack(
      alignment: Alignment(0, 0),
      children: [
        Column(
          children: [
            Container(
              height: 55,
              color: Color(0xffCECECE),
            ),
            Container(
              height: 55,
              color: Color(0xFF292929),
            )
          ],
        ),
        fuckedLine()
      ],
    );
  }

  Widget fuckedLine() {
    return Material(
      color: Color(0xff404040),
      borderRadius: BorderRadius.all(
        Radius.circular(70),
      ),
      elevation: normalElevation,
      child: Container(
          child: Column(
        children: [
          SizedBox(height: 15),
          Text(
            "  Курс будет проходить онлайн с октября 2021 года по апрель 2022 года.  ",
            style: normalTextStyle(normalTextSize),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
        ],
      )),
    );
  }

  Widget aboutCources(double width) {
    return Container(
        key: aboutKey,
        child: Column(
          children: [
            SizedBox(height: horizontalIndent * 2),
            (width > switchToMobileSize)
                ? Row(
                    children: [
                      SizedBox(
                          width: (width < maxWidth)
                              ? (textIndent)
                              : ((width - maxWidth) / 2 + textIndent)),
                      Flexible(
                        child: Container(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Что за курсы?",
                                  style: boldTextStyle(36.0),
                                ),
                                spaceEnter,
                                TextSpan(
                                  text:
                                      "Тебе ждут 40 интересных занятий, которые будут проходить онлайн вечером дважды в неделю. После каждого занятия мы даем несложное домашнее задание, поэтому резервируй еще 2 часа от своего свободного времени на выполнение домашки. Билл Гейтс говорил, что “много спать - признак лени”, поэтому тех, кто не умеет укладываться в дедлайны, отчисляем.",
                                  style: normalTextStyle(normalTextSize),
                                ),
                                spaceEnter,
                                TextSpan(
                                  text:
                                      "Чтобы пройти отбор, тебе необходимо знать как минимум один из языков программирования на уровне записи и чтения файлов. Мы не учим программировать с нуля.",
                                  style: normalTextStyle(normalTextSize),
                                ),
                                spaceEnter,
                                TextSpan(
                                  text:
                                      "Мы ждем школьников 8-11 классов, которые по-настоящему замотивированы и нацелены на крутой результат! Будет сложно, но интересно.",
                                  style: normalTextStyle(normalTextSize),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: horizontalIndent * 4),
                      // maybe
                      Image(
                        image: AssetImage(threeGuysImage),
                        width: (width > 800) ? 400 : 300,
                      ),
                      SizedBox(
                          width: (width < maxWidth)
                              ? (textIndent)
                              : ((width - maxWidth) / 2 + textIndent)),
                    ],
                  )
                : Row(
                    children: [
                      SizedBox(width: textIndent / 2),
                      Flexible(
                        child: Column(
                          children: [
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Что за курсы?",
                                      style: boldTextStyle(36.0),
                                    ),
                                    spaceEnter,
                                    TextSpan(
                                      text:
                                          "Тебе ждут 40 интересных занятий, которые будут проходить онлайн вечером дважды в неделю. После каждого занятия мы даем несложное домашнее задание, поэтому резервируй еще 2 часа от своего свободного времени на выполнение домашки. Билл Гейтс говорил, что “много спать - признак лени”, поэтому тех, кто не умеет укладываться в дедлайны, отчисляем.",
                                      style: normalTextStyle(normalTextSize),
                                    ),
                                    spaceEnter,
                                    TextSpan(
                                      text:
                                          "Чтобы пройти отбор, тебе необходимо знать как минимум один из языков программирования на уровне записи и чтения файлов. Мы не учим программировать с нуля.",
                                      style: normalTextStyle(normalTextSize),
                                    ),
                                    spaceEnter,
                                    TextSpan(
                                      text:
                                          "Мы ждем школьников 8-11 классов, которые по-настоящему замотивированы и нацелены на крутой результат! Будет сложно, но интересно.",
                                      style: normalTextStyle(normalTextSize),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Image(
                                image: AssetImage(threeGuysImage), height: 500),
                          ],
                        ),
                      ),
                      SizedBox(width: textIndent / 2),
                    ],
                  ),
            SizedBox(height: horizontalIndent * 2),
          ],
        ));
  }

  Widget aboutCourcesOld(double width) {
    return Container(
      key: aboutCourcesKey,
      child: (width > navBarToMobile)
          ? Container(
              child: Row(
                children: [
                  Flexible(
                      child: Container(
                          child: RichText(
                              text: TextSpan(children: [
                    TextSpan(
                        text: "Что за курсы?\n", style: boldTextStyle(36.0)),
                    TextSpan(
                        text:
                            "Это спецпрограмма, где ты получишь практические ",
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
                  Image(
                      image: AssetImage("assets/images/logo.png"), height: 300)
                ],
              ),
            )
          : Column(
              children: [
                Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Что за курсы?\n",
                            style: boldTextStyle(36.0)),
                        TextSpan(
                            text:
                                "Это спецпрограмма, где ты получишь практические ",
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
                        image: AssetImage("assets/images/logo.png"),
                        height: 300))
              ],
            ),
    );
  }

  Widget whatIsAcademyText() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1E88E5),
            Color(0xff1F67A7),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Что такое академия?",
          style: boldTextStyle(48.0),
        ),
      ),
    );
  }

  Widget whatIsAcademyAnswer(double width) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffCECECE),
      ),
      child: Container(
        width: maxWidth,
        child: (width > switchToMobileSize)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: (width < maxWidth)
                          ? (width / 16)
                          : ((width - maxWidth) / 2 + textIndent)),
                  Flexible(child: skills()),
                  SizedBox(width: horizontalIndent),
                  Spacer(),
                  Flexible(child: practice()),
                  Spacer(),
                  Flexible(child: project()),
                  SizedBox(
                      width: (width < maxWidth)
                          ? (width / 16)
                          : ((width - maxWidth) / 2 + textIndent)),
                ],
              )
            : Row(
                children: [
                  SizedBox(width: horizontalIndent),
                  Flexible(
                    child: Column(
                      children: [
                        skills(),
                        practice(),
                        project(),
                      ],
                    ),
                  ),
                  SizedBox(width: width / 16),
                ],
              ),
      ),
    );
  }

  // 1 4 1 4 1 4 1 sum
  Widget skills() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 25),
          Image(
            image: AssetImage(skillsImage),
            height: 80,
          ),
          SizedBox(height: schemeIndent),
          Text(
            "Здесь получают крутые навыки разработки на языке программирования C#",
            style: normalBlackTextStyle(normalTextSize),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget practice() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 25),
          Image(
            image: AssetImage(practiceImage),
            height: 80,
          ),
          SizedBox(height: schemeIndent),
          Text(
            "Тебя ждет проект, который ты запилишь вместе с командой и добавишь в свое портфолио",
            style: normalBlackTextStyle(normalTextSize),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget project() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 25),
          Image(
            image: AssetImage(projectImage),
            height: 80,
          ),
          SizedBox(height: schemeIndent),
          Text(
            "Практические занятия, лекции и домашка уже в комплекте, так что времени скучать не будет!",
            style: normalBlackTextStyle(normalTextSize),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget learningScheme(double width) {
    return Container(
      color: Color(0xff404040),
      child: Column(
        children: [
          SizedBox(height: horizontalIndent),
          Text(
            "Схема обучения",
            style: boldTextStyle(36.0),
            textAlign: TextAlign.center,
          ),
          (width > navBarToMobile)
              ? Column(
                  children: [
                    SizedBox(height: textIndent),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: (width < maxWidth)
                                ? (textIndent)
                                : ((width - maxWidth) / 2 + textIndent)),
                        firstPeriod(),
                        SizedBox(width: horizontalIndent),
                        DottedLine(
                          direction: Axis.vertical,
                          lineLength: 200,
                          dashColor: Color(0xffC4C4C4),
                        ),
                        SizedBox(width: horizontalIndent),
                        secondPeriod(),
                        SizedBox(width: horizontalIndent),
                        DottedLine(
                          direction: Axis.vertical,
                          lineLength: 200,
                          dashColor: Color(0xffC4C4C4),
                        ),
                        SizedBox(width: horizontalIndent),
                        thirdPeriod(width),
                        SizedBox(
                            width: (width < maxWidth)
                                ? (textHeight)
                                : ((width - maxWidth) / 2 + textIndent)),
                      ],
                    ),
                    SizedBox(height: textIndent),
                  ],
                )
              : Row(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(height: horizontalIndent * 2),
                        firstPeriod(),
                        SizedBox(height: horizontalIndent / 2),
                        DottedLine(
                          lineLength: 350,
                          dashColor: Color(0xffC4C4C4),
                        ),
                        SizedBox(height: horizontalIndent / 2),
                        secondPeriod(),
                        SizedBox(height: horizontalIndent / 2),
                        DottedLine(
                          lineLength: 350,
                          dashColor: Color(0xffC4C4C4),
                        ),
                        SizedBox(height: horizontalIndent / 2),
                        thirdPeriod(width),
                        SizedBox(height: horizontalIndent),
                      ],
                    ),
                    Spacer()
                  ],
                ),
        ],
      ),
    );
  }

  Widget firstPeriod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "октябрь-ноябрь",
          style: normalTextStyle(14),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: schemeIndent,
        ),
        Material(
          color: Color(0xffC7C7C7),
          borderRadius: BorderRadius.all(
            Radius.circular(70),
          ),
          elevation: normalElevation,
          child: Container(
            height: 40,
            width: 240,
            child: Column(
              children: [
                Spacer(),
                Text(
                  "Изучение синтаксиса",
                  style: normalBlackTextStyle(normalTextSize),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget secondPeriod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ноябрь-декабрь",
          style: normalTextStyle(14),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: schemeIndent,
        ),
        Material(
          color: Color(0xffC7C7C7),
          borderRadius: BorderRadius.all(
            Radius.circular(70),
          ),
          elevation: normalElevation,
          child: Container(
            height: 40,
            width: 240,
            child: Column(
              children: [
                Spacer(),
                Text(
                  "Веб-направление",
                  style: normalBlackTextStyle(normalTextSize),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: schemeIndent,
        ),
        Material(
          color: Color(0xffC7C7C7),
          borderRadius: BorderRadius.all(
            Radius.circular(70),
          ),
          elevation: normalElevation,
          child: Container(
            height: 40,
            width: 240,
            child: Column(
              children: [
                Spacer(),
                Text(
                  "Десктопное направление",
                  style: normalBlackTextStyle(normalTextSize),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: schemeIndent,
        ),
        Material(
          color: Color(0xffC7C7C7),
          borderRadius: BorderRadius.all(
            Radius.circular(70),
          ),
          elevation: normalElevation,
          child: Container(
            height: 40,
            width: 240,
            child: Column(
              children: [
                Spacer(),
                Text(
                  "GameDev направление",
                  style: normalBlackTextStyle(normalTextSize),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        Container(
          width: 240,
          child: Text(
            "* На данном этапе выбор направления производится по конкурсу посещаемости и оценок за практические работы.",
            style: normalTextStyle(12.0),
          ),
        ),
      ],
    );
  }

  Widget thirdPeriod(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "январь-апрель",
          style: normalTextStyle(14),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: schemeIndent,
        ),
        Row(
          children: [
            Material(
              color: Color(0xffC7C7C7),
              borderRadius: BorderRadius.all(
                Radius.circular(70),
              ),
              elevation: normalElevation,
              child: Container(
                height: 40,
                width: 60,
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      "SQL",
                      style: normalBlackTextStyle(normalTextSize),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: horizontalIndent),
            Material(
              color: Color(0xffC7C7C7),
              borderRadius: BorderRadius.all(
                Radius.circular(70),
              ),
              elevation: normalElevation,
              child: Container(
                height: 40,
                width: 60,
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      "Боты",
                      style: normalBlackTextStyle(normalTextSize),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: horizontalIndent),
            Material(
              color: Color(0xffC7C7C7),
              borderRadius: BorderRadius.all(
                Radius.circular(70),
              ),
              elevation: normalElevation,
              child: Container(
                height: 40,
                width: 60,
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      "ML",
                      style: normalBlackTextStyle(normalTextSize),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: horizontalIndent),
            Material(
              color: Color(0xffC7C7C7),
              borderRadius: BorderRadius.all(
                Radius.circular(70),
              ),
              elevation: normalElevation,
              child: Container(
                height: 40,
                width: 60,
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      "...",
                      style: normalBlackTextStyle(normalTextSize),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: schemeIndent,
        ),
        Container(
          color: Color(0xff1E88E5),
          height: 5,
          width: (width > navBarToMobile)
              ? ((width < maxWidth)
                  ? (width - textIndent * 2 - 240 * 2 - horizontalIndent * 4)
                  : 500)
              : 400,
        ),
        SizedBox(
          height: schemeIndent,
        ),
        Text(
          "проектная деятельность",
          style: normalTextStyle(12),
          textAlign: TextAlign.left,
        )
      ],
    );
  }

  Widget howItWorks(double width) {
    if (width > navBarToMobile) {
      // Big size
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1E88E5), Color(0xff1F67A7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          width: maxWidth,
          child: Column(
            children: [
              SizedBox(height: horizontalIndent),
              Text(
                "Как это работает",
                style: normalTextStyle(36.0),
              ),
              SizedBox(height: horizontalIndent),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: (width < maxWidth)
                          ? (textIndent)
                          : ((width - maxWidth) / 2 + textIndent)),
                  Flexible(child: firstTime()),
                  Spacer(),
                  Flexible(child: secondTime()),
                  Spacer(),
                  Flexible(child: thirdTime()),
                  Spacer(),
                  Flexible(child: fourthTime()),
                  SizedBox(
                      width: (width < maxWidth)
                          ? (textIndent)
                          : ((width - maxWidth) / 2 + textIndent)),
                ],
              ),
              SizedBox(height: horizontalIndent),
            ],
          ),
        ),
      );
    } else if (width > switchToMobileSize) {
      // Middle size
      return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1E88E5), Color(0xff1F67A7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: textIndent),
                  Flexible(
                    child: Column(
                      children: [
                        SizedBox(height: horizontalIndent),
                        Text(
                          "Как это работает",
                          style: normalTextStyle(36.0),
                        ),
                        SizedBox(height: horizontalIndent),
                        Row(
                          children: [
                            Flexible(child: firstTime()),
                            SizedBox(width: textIndent),
                            Flexible(child: secondTime()),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(child: thirdTime()),
                            SizedBox(width: textIndent),
                            Flexible(child: fourthTime()),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: textIndent),
                ],
              ),
              SizedBox(height: horizontalIndent),
            ],
          ));
    } else {
      // Little size
      return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1E88E5), Color(0xff1F67A7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: textIndent),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: horizontalIndent),
                    Container(
                      width: width,
                      child: Text(
                        "Как это работает",
                        style: normalTextStyle(36.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: horizontalIndent),
                    firstTime(),
                    SizedBox(height: horizontalIndent),
                    secondTime(),
                    SizedBox(height: horizontalIndent),
                    thirdTime(),
                    SizedBox(height: horizontalIndent),
                    fourthTime(),
                  ],
                ),
              ),
              SizedBox(width: textIndent),
            ],
          ));
    }
  }

  Widget firstTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(pencilImage),
          height: 70,
        ),
        Text(
          "1-31 сентября",
          style: normalTextStyle(24),
          textAlign: TextAlign.start,
        ),
        Text(
          "Вписываетесь через форму регистрации на сайте",
          style: normalTextStyle(normalTextSize),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget secondTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(pontyCase),
          height: 70,
        ),
        Text(
          "4 октября",
          style: normalTextStyle(24),
          textAlign: TextAlign.start,
        ),
        Text(
          "Первая встреча: знакомимся друг с другом",
          style: normalTextStyle(normalTextSize),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget thirdTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(notMacbook),
          height: 70,
        ),
        Text(
          "6 окт - 24 апр",
          style: normalTextStyle(24),
          textAlign: TextAlign.start,
        ),
        Text(
          "Проходите обучение и работаете над проектом",
          style: normalTextStyle(normalTextSize),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget fourthTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(carrotidk),
          height: 70,
        ),
        Text(
          "25-30 апреля",
          style: normalTextStyle(24),
          textAlign: TextAlign.start,
        ),
        Text(
          "Демо-день: презентуете результаты своей работы, подводим итоги",
          style: normalTextStyle(normalTextSize),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget directions(double width) {
    if (width > navBarToMobile) {
      // Big size
      return Container(
        color: Color(0xff2F2F2F),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: horizontalIndent),
            Row(children: [
              SizedBox(width: textIndent),
              Text(
                "Направления программы",
                style: normalTextStyle(36.0),
              ),
            ]),
            SizedBox(height: horizontalIndent),
            Row(
              children: [
                SizedBox(width: textIndent),
                // first
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff404040),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  width: (width - textIndent * 2 - schemeIndent * 2) / 3,
                  height: (width - textIndent * 2 - schemeIndent * 2) / 3,
                  child: firstDirection(width),
                ),
                SizedBox(width: schemeIndent),
                // second
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff404040),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  width: (width - textIndent * 2 - schemeIndent * 2) / 3,
                  height: (width - textIndent * 2 - schemeIndent * 2) / 3,
                  child: secondDirection(width),
                ),
                SizedBox(width: schemeIndent),
                // third
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff404040),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  width: (width - textIndent * 2 - schemeIndent * 2) / 3,
                  height: (width - textIndent * 2 - schemeIndent * 2) / 3,
                  child: thirdDirection(width),
                ),
                SizedBox(width: textIndent),
              ],
            ),
            SizedBox(height: horizontalIndent),
          ],
        ),
      );
    } else if (width > switchToMobileSize) {
      // Middle size
      return Container(
        color: Color(0xff2F2F2F),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: horizontalIndent),
            Row(children: [
              SizedBox(width: textIndent),
              Text(
                "Направления программы",
                style: normalTextStyle(36.0),
              ),
            ]),
            SizedBox(height: horizontalIndent),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: textIndent),
                // first
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff404040),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  width: (width - textIndent * 2 - schemeIndent * 2) / 2,
                  height: (width - textIndent * 2 - schemeIndent * 2) / 2,
                  child: firstDirection(width),
                ),
                SizedBox(width: schemeIndent),
                // second
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff404040),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  width: (width - textIndent * 2 - schemeIndent * 2) / 2,
                  height: (width - textIndent * 2 - schemeIndent * 2) / 2,
                  child: secondDirection(width),
                ),
                SizedBox(width: textIndent),
              ],
            ),
            SizedBox(height: schemeIndent),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // third
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff404040),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  width: (width - textIndent * 2 - schemeIndent * 2) / 2,
                  height: (width - textIndent * 2 - schemeIndent * 2) / 2,
                  child: thirdDirection(width),
                ),
              ],
            ),
            SizedBox(height: horizontalIndent),
          ],
        ),
      );
    } else {
      // Little size
      return Container(
        color: Color(0xff2F2F2F),
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: horizontalIndent),
            Text(
              "Направления программы",
              textAlign: TextAlign.center,
              style: normalTextStyle(36.0),
            ),

            SizedBox(height: horizontalIndent),
            SizedBox(width: textIndent),
            // first
            Container(
              decoration: BoxDecoration(
                color: Color(0xff404040),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              width: (width - textIndent * 2 - schemeIndent * 2),
              height: (width - textIndent * 2 - schemeIndent * 2),
              child: firstDirection(width),
            ),
            SizedBox(height: schemeIndent),
            // second
            Container(
              decoration: BoxDecoration(
                color: Color(0xff404040),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              width: (width - textIndent * 2 - schemeIndent * 2),
              height: (width - textIndent * 2 - schemeIndent * 2),
              child: secondDirection(width),
            ),
            SizedBox(height: schemeIndent),
            // third
            Container(
              decoration: BoxDecoration(
                color: Color(0xff404040),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              width: (width - textIndent * 2 - schemeIndent * 2),
              height: (width - textIndent * 2 - schemeIndent * 2),
              child: thirdDirection(width),
            ),
            SizedBox(height: horizontalIndent),
          ],
        ),
      );
    }
  }

  Widget firstDirection(double width) {
    return Row(
      children: [
        SizedBox(width: textIndent),
        Column(children: [
          Image(
            image: AssetImage(aspDirectionImage),
          ),
          Text("ASP.NET"),
        ])
      ],
    );
  }

  Widget secondDirection(double width) {
    return Row(
      children: [
        SizedBox(width: textIndent),
        Column(
          children: [
            Image(
              image: AssetImage(wpfDirectionImage),
              height:
                  (width - textIndent * 2 - schemeIndent * 2) / 3 - textHeight,
            ),
            Container(
              height: textHeight,
              child: Text("WPF"),
            ),
          ],
        ),
      ],
    );
  }

  Widget thirdDirection(double width) {
    return Row(
      children: [
        SizedBox(width: textIndent),
        Column(
          children: [
            Image(
              image: AssetImage(xamarinDirectionImage),
            ),
            Text("Xamarin"),
          ],
        ),
      ],
    );
  }

  Widget navBar(double width, double height) {
    if (width > navBarToMobile) {
      return Container(
        decoration: BoxDecoration(color: Color(0xFF000000)),
        width: double.infinity,
        height: navBarHeight,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Container(
              width: maxWidth,
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
        onPressed: () {
          Scrollable.ensureVisible(aboutKey.currentContext!);
          setState(() {
            isNavBarOpened = false;
          });
        },
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
        color: Color(0xff0079D5),
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
}
