// widgets from the test code
import 'dart:html' as html;
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

TextStyle boldBlackTextStyle(double fontSize) {
  return TextStyle(
      fontSize: fontSize,
      color: Colors.black,
      fontFamily: "segoeui",
      fontWeight: FontWeight.w600);
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
const double navBarHeight = 50.0;
const double navBarIndent = navBarHeight;
const double menuButtonWidth = navBarHeight;
const double textIndent = 70.0;
// double coverIndent = 500.0;
const double schemeIndent = 8.0;
const double horizontalIndent = 20;
const double switchToMobileSize = 650;
const double navBarToMobile = 1000;
const double normalTextSize = 18.0;
const double navBarTextSize = 18.0;
const double normalElevation = 5.0;
const double textHeight = 48.0;
const double maxWidth = 1500;
const double readyWidth = 200.0;
// images
const String logoImage = "assets/images/logo.png";
const String codeImage = "assets/images/code.jpg";

// what is academy answer block
const String skillsImage = "assets/images/smile.png";
const String practiceImage = "assets/images/school.png";
const String projectImage = "assets/images/graduation.png";

// what is academy question block
const String threeGuysImage = "assets/images/three-guys.png";

// how it works block
const String pencilImage = "assets/images/pencil.png";
const String pontyCase = "assets/images/briefcase.png";
const String notMacbook = "assets/images/pc.png";
const String carrotidk = "assets/images/party-popper.png";

// directions blockconst
const String aspDirectionImage = "assets/images/unity-icon.png";
const String wpfDirectionImage = "assets/images/wpf-icon.png";
const String xamarinDirectionImage = "assets/images/xamarin-icon.png";

// people
const String AKimage = "assets/images/faces/ak.png";
const String DMimage = "assets/images/faces/dm.png";
const String LMimage = "assets/images/faces/lm.png";
const String ASimage = "assets/images/faces/as.png";

const String MKimage = "assets/images/faces/mk.png";
const String EMimage = "assets/images/faces/em.png";
const String ACimage = "assets/images/faces/ac.png";

//areYouReady block
const String calendarImage = "assets/images/calendar.png";

const String formLink =
    "https://forms.office.com/Pages/ResponsePage.aspx?id=oBzDhDusrk6tEVGdgCM-b9P9r1OKddVJrVkKWuN2F9dUNEQwUUtHNVM0WDRSV0sxS1VSTkYxN0xHUS4u";

class MyHomePageState extends State<MyHomePage> {
  // keys
  final academyKey = new GlobalKey();

  final aboutKey = new GlobalKey();
  // final answersKey = new GlobalKey();
  final directionsKey = new GlobalKey();
  final selectionKey = new GlobalKey();
  final contactsKey = new GlobalKey();

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
          whatIsAcademyText(width),
          whatIsAcademyAnswer(width),
          united(width),
          aboutCources(width),
          learningScheme(width),
          howItWorks(width),
          directions(width),
          areYouReady(width),
          united2(width),
          supportByMLSA(width),
          faces(width),
        ],
      ),
    );
  }

  Widget coverFrame(double width, height) {
    return Container(
      key: academyKey,
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
            width: 130 + width / 5,
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
                    width: width / 5,
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
                width:
                    (width > switchToMobileSize) ? width / 5 : (width / 5 / 2),
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
                width: (width > switchToMobileSize) ? 0 : (width / 5 / 2),
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
        line()
      ],
    );
  }

  Widget line() {
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

  Widget united2(double width) {
    return Stack(
      alignment: Alignment(0, 0),
      children: [
        Column(
          children: [
            Container(
              width: ((width > navBarToMobile))
                  ? (readyWidth * 3 + textIndent * 4 + horizontalIndent * 4)
                  : ((readyWidth + horizontalIndent * 2) * 2),
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xffCECECE),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Container(height: 50)
          ],
        ),
        (width > navBarToMobile) ? line2() : applyToMk2()
      ],
    );
  }

  Widget line2() {
    return Material(
      color: Color(0xff404040),
      borderRadius: BorderRadius.all(
        Radius.circular(70),
      ),
      elevation: normalElevation,
      child: Container(
        height: 60,
        width: 700,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: horizontalIndent),
            Text(
              "  Подача заявок открыта до 31 сентября. Поспеши!  ",
              style: normalTextStyle(normalTextSize),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            applyToMk2(),
            SizedBox(width: 5.0),
          ],
        ),
      ),
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
                                      "Тебя ждут 40 интересных занятий, которые будут проходить онлайн вечером дважды в неделю. После каждого занятия мы даем несложное домашнее задание, поэтому резервируй еще 2 часа от своего свободного времени на выполнение домашки. Билл Гейтс говорил, что “много спать - признак лени”, поэтому тех, кто не умеет укладываться в дедлайны, отчисляем.",
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
                                          "Тебя ждут 40 интересных занятий, которые будут проходить онлайн вечером дважды в неделю. После каждого занятия мы даем несложное домашнее задание, поэтому резервируй еще 2 часа от своего свободного времени на выполнение домашки. Билл Гейтс говорил, что “много спать - признак лени”, поэтому тех, кто не умеет укладываться в дедлайны, отчисляем.",
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

  // what is academy
  Widget whatIsAcademyText(double width) {
    return Container(
      height: (width > switchToMobileSize) ? 100 : 150,
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

  // scheme
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
                        firstPeriod(width),
                        SizedBox(width: horizontalIndent),
                        DottedLine(
                          direction: Axis.vertical,
                          lineLength: 200,
                          dashColor: Color(0xffC4C4C4),
                        ),
                        SizedBox(width: horizontalIndent),
                        secondPeriod(width),
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
                        firstPeriod(width),
                        SizedBox(height: horizontalIndent / 2),
                        DottedLine(
                          lineLength: (width > switchToMobileSize) ? 350 : 190,
                          dashColor: Color(0xffC4C4C4),
                        ),
                        SizedBox(height: horizontalIndent / 2),
                        secondPeriod(width),
                        SizedBox(height: horizontalIndent / 2),
                        DottedLine(
                          lineLength: (width > switchToMobileSize) ? 350 : 190,
                          dashColor: Color(0xffC4C4C4),
                        ),
                        SizedBox(height: horizontalIndent / 2),
                        thirdPeriod(width),
                        SizedBox(height: horizontalIndent),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
        ],
      ),
    );
  }

  Widget firstPeriod(double width) {
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
            height: (width > switchToMobileSize) ? 40 : 75,
            width: (width > switchToMobileSize) ? 240 : 170,
            child: Column(
              children: [
                Spacer(),
                Text(
                  (width > switchToMobileSize)
                      ? "Изучение синтаксиса"
                      : "Изучение\nсинтаксиса",
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

  Widget secondPeriod(double width) {
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
            height: (width > switchToMobileSize) ? 40 : 75,
            width: (width > switchToMobileSize) ? 240 : 170,
            child: Column(
              children: [
                Spacer(),
                Text(
                  (width > switchToMobileSize)
                      ? "Веб-направление"
                      : "Веб\nнаправление",
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
            height: (width > switchToMobileSize) ? 40 : 75,
            width: (width > switchToMobileSize) ? 240 : 170,
            child: Column(
              children: [
                Spacer(),
                Text(
                  (width > switchToMobileSize)
                      ? "Десктопное направление"
                      : "Десктопное\nнаправление",
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
            height: (width > switchToMobileSize) ? 40 : 75,
            width: (width > switchToMobileSize) ? 240 : 170,
            child: Column(
              children: [
                Spacer(),
                Text(
                  (width > switchToMobileSize)
                      ? "GameDev направление"
                      : "GameDev\nнаправление",
                  style: normalBlackTextStyle(normalTextSize),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        Container(
          width: (width > switchToMobileSize) ? 240 : 170,
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
              : 300,
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

  //howitworks
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

  // directions
  Widget directions(double width) {
    if (width > navBarToMobile) {
      // Big size
      return Container(
        key: directionsKey,
        width: double.infinity,
        child: Container(
            width: maxWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: horizontalIndent),
                    Row(
                      children: [
                        SizedBox(width: textIndent),
                        Text(
                          "Направления программы",
                          style: normalTextStyle(36.0),
                        ),
                      ],
                    ),
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
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          width: (width < maxWidth)
                              ? (width - textIndent * 2 - schemeIndent * 2) / 3
                              : (maxWidth - textIndent * 2 - schemeIndent * 2) /
                                  3,
                          height: (width < maxWidth)
                              ? (width - textIndent * 2 - schemeIndent * 2) / 3
                              : (maxWidth - textIndent * 2 - schemeIndent * 2) /
                                  3,
                          child: firstDirection((width < maxWidth)
                              ? (width - textIndent * 2 - schemeIndent * 2) / 3
                              : (maxWidth - textIndent * 2 - schemeIndent * 2) /
                                  3),
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
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          width: (width < maxWidth)
                              ? (width - textIndent * 2 - schemeIndent * 2) / 3
                              : (maxWidth - textIndent * 2 - schemeIndent * 2) /
                                  3,
                          height: (width < maxWidth)
                              ? (width - textIndent * 2 - schemeIndent * 2) / 3
                              : (maxWidth - textIndent * 2 - schemeIndent * 2) /
                                  3,
                          child: secondDirection((width < maxWidth)
                              ? (width - textIndent * 2 - schemeIndent * 2) / 3
                              : (maxWidth - textIndent * 2 - schemeIndent * 2) /
                                  3),
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
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          width: (width < maxWidth)
                              ? (width - textIndent * 2 - schemeIndent * 2) / 3
                              : (maxWidth - textIndent * 2 - schemeIndent * 2) /
                                  3,
                          height: (width < maxWidth)
                              ? (width - textIndent * 2 - schemeIndent * 2) / 3
                              : (maxWidth - textIndent * 2 - schemeIndent * 2) /
                                  3,
                          child: thirdDirection((width < maxWidth)
                              ? (width - textIndent * 2 - schemeIndent * 2) / 3
                              : (maxWidth - textIndent * 2 - schemeIndent * 2) /
                                  3),
                        ),
                        SizedBox(width: textIndent),
                      ],
                    ),
                    SizedBox(height: horizontalIndent),
                  ],
                ),
              ],
            )),
      );
    } else if (width > switchToMobileSize) {
      // Middle size
      return Container(
        key: directionsKey,
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
                  child: firstDirection(
                      (width - textIndent * 2 - schemeIndent * 2) / 2),
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
                  child: secondDirection(
                      (width - textIndent * 2 - schemeIndent * 2) / 2),
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
                  child: thirdDirection(
                      (width - textIndent * 2 - schemeIndent * 2) / 2),
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
        key: directionsKey,
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
              child:
                  firstDirection((width - textIndent * 2 - schemeIndent * 2)),
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
              child:
                  secondDirection((width - textIndent * 2 - schemeIndent * 2)),
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
              child:
                  thirdDirection((width - textIndent * 2 - schemeIndent * 2)),
            ),
            SizedBox(height: horizontalIndent),
          ],
        ),
      );
    }
  }

  Widget firstDirection(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          Spacer(),
          Image(
            image: AssetImage(aspDirectionImage),
            height: width - horizontalIndent * 2 - textHeight,
          ),
          SizedBox(height: schemeIndent),
          Text(
            "Unity",
            style: normalTextStyle(24.0),
          ),
          Spacer(),
        ])
      ],
    );
  }

  Widget secondDirection(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          Spacer(),
          Image(
            image: AssetImage(wpfDirectionImage),
            height: width - horizontalIndent * 2 - textHeight,
          ),
          SizedBox(height: schemeIndent),
          Text(
            "WPF",
            style: normalTextStyle(24.0),
          ),
          Spacer(),
        ])
      ],
    );
  }

  Widget thirdDirection(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          Spacer(),
          Image(
            image: AssetImage(xamarinDirectionImage),
            height: width - horizontalIndent * 2 - textHeight,
          ),
          SizedBox(height: schemeIndent),
          Text(
            "Xamarin",
            style: normalTextStyle(24.0),
          ),
          Spacer(),
        ])
      ],
    );
  }

  // are you ready?
  Widget areYouReady(double width) {
    if (width > navBarToMobile) {
      return Container(
        key: selectionKey,
        child: Container(
          width: readyWidth * 3 + textIndent * 4 + horizontalIndent * 4,
          decoration: BoxDecoration(
            color: Color(0xffCECECE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(),
              Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Уже готов стать частью академии?",
                    style: boldBlackTextStyle(36.0),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      firstStep(),
                      SizedBox(width: textIndent),
                      secondStep(),
                      SizedBox(width: textIndent),
                      thirdStep(),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return Container(
        key: selectionKey,
        child: Container(
          width: (readyWidth + horizontalIndent * 2) * 2,
          decoration: BoxDecoration(
            color: Color(0xffCECECE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Уже готов стать\nчастью академии?",
                    style: boldBlackTextStyle(36.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: horizontalIndent),
                  firstStep(),
                  SizedBox(height: horizontalIndent),
                  secondStep(),
                  SizedBox(height: horizontalIndent),
                  thirdStep(),
                  SizedBox(height: horizontalIndent),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );
    }
  }

  Widget firstStep() {
    return Container(
      child: Column(
        children: [
          Container(
              height: 190,
              decoration: BoxDecoration(
                color: Color(0xff2F2F2F),
                shape: BoxShape.circle,
              ),
              child: Image(
                image: AssetImage(pencilImage),
                height: 75,
              )),
          SizedBox(height: horizontalIndent),
          Text(
            "Подай заявку на\nнашем сайте",
            textAlign: TextAlign.center,
            style: normalBlackTextStyle(24.0),
          ),
        ],
      ),
    );
  }

  Widget secondStep() {
    return Container(
      child: Column(
        children: [
          Container(
              height: 190,
              decoration: BoxDecoration(
                color: Color(0xff2F2F2F),
                shape: BoxShape.circle,
              ),
              child: Image(
                image: AssetImage(calendarImage),
                height: 75,
              )),
          SizedBox(height: horizontalIndent),
          Text(
            "Пройти\nсобеседование",
            textAlign: TextAlign.center,
            style: normalBlackTextStyle(24.0),
          ),
        ],
      ),
    );
  }

  Widget thirdStep() {
    return Container(
      child: Column(
        children: [
          Container(
              height: 190,
              decoration: BoxDecoration(
                color: Color(0xff2F2F2F),
                shape: BoxShape.circle,
              ),
              child: Image(
                image: AssetImage(carrotidk),
                height: 75,
              )),
          SizedBox(height: horizontalIndent),
          Text(
            "Приходи на первое\nзанятие!",
            textAlign: TextAlign.center,
            style: normalBlackTextStyle(24.0),
          ),
        ],
      ),
    );
  }

  // SupportByMLSA
  Widget supportByMLSA(double width) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: horizontalIndent),
          Material(
            color: Color(0xff404040),
            child: Container(
              child: (width > switchToMobileSize)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: textIndent),
                        Column(
                          children: [
                            SizedBox(height: schemeIndent),
                            Image(
                              image: AssetImage(logoImage),
                              height: 120,
                            ),
                            SizedBox(height: schemeIndent)
                          ],
                        ),
                        SizedBox(width: horizontalIndent),
                        Flexible(
                          child: Text(
                            "Курс организован при поддержке международной студенческой\nпартнерской программы “Microsoft Learn Student Ambassadors”",
                            textAlign: TextAlign.center,
                            style: normalTextStyle(24.0),
                          ),
                        ),
                        SizedBox(width: textIndent),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: textIndent),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: horizontalIndent / 3),
                              Image(
                                image: AssetImage(logoImage),
                                height: 120,
                              ),
                              SizedBox(height: schemeIndent),
                              Text(
                                "Курс организован при поддержке международной студенческой партнерской программы “Microsoft Learn Student Ambassadors”",
                                textAlign: TextAlign.center,
                                style: normalTextStyle(24.0),
                              ),
                              SizedBox(height: horizontalIndent / 3),
                            ],
                          ),
                        ),
                        SizedBox(width: textIndent),
                      ],
                    ),
            ),
          ),
          SizedBox(height: horizontalIndent),
        ],
      ),
    );
  }

//  faces
  Widget faces(double width) {
    return Container(
      key: contactsKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: (width > 1400)
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: (width > 1400)
                ? [
                    facePC(
                      AKimage,
                      "Антон Кисляков",
                      "Руководитель программы",
                      "antonkislyakov\n@studentambassadors.com",
                    ),
                    SizedBox(width: horizontalIndent),
                    facePC(
                      DMimage,
                      "Денис Миков",
                      "Заместитель руководителя",
                      "mikov@wasp-academy.com",
                    ),
                    SizedBox(width: horizontalIndent),
                    facePC(
                      LMimage,
                      "Лаура Манукян",
                      "Координатор программы",
                      "manukian@wasp-academy.com",
                    ),
                    SizedBox(width: horizontalIndent),
                    facePC(
                      ASimage,
                      "Алексей Штей",
                      "Ops-инженер",
                      "none",
                    ),
                  ]
                : [
                    SizedBox(width: horizontalIndent / 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        faceMobile(
                          AKimage,
                          "Антон Кисляков",
                          "Руководитель программы",
                          "antonkislyakov@studentambassadors.com",
                          width,
                        ),
                        SizedBox(width: horizontalIndent),
                        faceMobile(
                          DMimage,
                          "Денис Миков",
                          "Заместитель руководителя",
                          "breakout.dm.06@gmail.com",
                          width,
                        ),
                        SizedBox(width: textIndent),
                        faceMobile(
                          LMimage,
                          "Лаура Манукян",
                          "Координатор программы",
                          "none",
                          width,
                        ),
                        SizedBox(width: horizontalIndent),
                        faceMobile(
                          ASimage,
                          "Алексей Штей",
                          "Ops-инженер",
                          "none",
                          width,
                        ),
                        SizedBox(width: horizontalIndent),
                        faceMobile(
                          MKimage,
                          "Максим Корсаков",
                          "Преподаватель Unity",
                          "none",
                          width,
                        ),
                        SizedBox(width: horizontalIndent),
                        faceMobile(
                          EMimage,
                          "Евгения Морозова",
                          "Менеджер команд",
                          "none",
                          width,
                        ),
                        SizedBox(width: horizontalIndent),
                        faceMobile(
                          ACimage,
                          "Александр Цымбалов",
                          "Эксперт",
                          "none",
                          width,
                        ),
                        SizedBox(width: horizontalIndent),
                        faceMobile(
                          ACimage,
                          "Тимофей Булгаков",
                          "Преподаватель C#",
                          "none",
                          width,
                        ),
                        SizedBox(width: horizontalIndent),
                        faceMobile(
                          ACimage,
                          "Евгений Збанок",
                          "Преподаватель Unity",
                          "none",
                          width,
                        ),
                      ],
                    ),
                    SizedBox(width: textIndent),
                  ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (width > 1400)
                ? [
                    facePC(
                      MKimage,
                      "Максим Корсаков",
                      "Преподаватель WPF",
                      "none",
                    ),
                    SizedBox(width: horizontalIndent),
                    facePC(
                      EMimage,
                      "Евгения Морозова",
                      "Менеджер команд",
                      "none",
                    ),
                    SizedBox(width: horizontalIndent),
                    facePC(
                      ACimage,
                      "Александр Цымбалов",
                      "Эксперт",
                      "none",
                    ),
                    SizedBox(width: horizontalIndent),
                    facePC(
                      ACimage,
                      "Тимофей Булгаков",
                      "Преподаватель C#",
                      "none",
                    ),
                  ]
                : [],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (width > 1400)
                ? [
                    facePC(
                      MKimage,
                      "Евгений Збанок",
                      "Преподаватель Unity",
                      "none",
                    ),
                  ]
                : [],
          ),
        ],
      ),
    );
  }

  Widget facePC(String photo, String name, String who, String email) {
    return Column(
      children: [
        SizedBox(height: horizontalIndent),
        CircleAvatar(
          radius: 120,
          backgroundImage: AssetImage(photo),
        ),
        SizedBox(height: schemeIndent),
        Text(
          name,
          style: normalTextStyle(24.0),
        ),
        Text(
          who,
          style: normalTextStyle(normalTextSize),
        ),
        (email != "none")
            ? SelectableText(
                email,
                style: normalTextStyle(16.0),
              )
            : Text(""),
        SizedBox(height: horizontalIndent),
      ],
    );
  }

  Widget faceMobile(
      String photo, String name, String who, String email, width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (width > switchToMobileSize)
            ? SizedBox(height: horizontalIndent)
            : Container(),
        Container(
          width: (width > switchToMobileSize) ? 150 : 50,
          height: (width > switchToMobileSize) ? 100 : 110,
          child: CircleAvatar(
            radius: (width > switchToMobileSize) ? 50 : 20,
            backgroundImage: AssetImage(photo),
          ),
        ),
        SizedBox(height: (width > switchToMobileSize) ? textIndent : 0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (width > 800)
              ? [
                  SizedBox(height: horizontalIndent),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: normalTextStyle(24.0),
                      ),
                      Text(
                        " — ",
                        style: normalTextStyle(24.0),
                      ),
                      Text(
                        who,
                        style: normalTextStyle(24.0),
                      ),
                    ],
                  ),
                  (email != "none")
                      ? SelectableText(
                          email,
                          style: normalTextStyle(16.0),
                        )
                      : Text(""),
                  SizedBox(height: horizontalIndent * 2),
                ]
              : [
                  SizedBox(height: horizontalIndent),
                  Text(
                    "  " + name,
                    style: normalTextStyle(16.0),
                  ),
                  Text(
                    "  " + who,
                    style: normalTextStyle(14.0),
                  ),
                  (email != "none")
                      ? SelectableText(
                          "  " + email,
                          style: normalTextStyle(12.0),
                        )
                      : Text(""),
                  SizedBox(height: horizontalIndent * 2),
                ],
        ),
        SizedBox(height: horizontalIndent),
      ],
    );
  }

  // navbar
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
                    // FAQTextButton(),
                    // SizedBox(width: 50),
                    contactsTextButton(),
                    SizedBox(width: 50),
                    applyTo(),
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
                child: applyTo(),
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
        onPressed: () {
          Scrollable.ensureVisible(directionsKey.currentContext!);
          setState(() {
            isNavBarOpened = false;
          });
        },
        child: Text("Направления", style: lightTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget selectionTextButton() {
    return TextButton(
        onPressed: () {
          Scrollable.ensureVisible(selectionKey.currentContext!);
          setState(() {
            isNavBarOpened = false;
          });
        },
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
        onPressed: () {
          Scrollable.ensureVisible(academyKey.currentContext!);
          setState(() {
            isNavBarOpened = false;
          });
        },
        child: Text("Academy", style: lightTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget contactsTextButton() {
    return TextButton(
        onPressed: () {
          Scrollable.ensureVisible(contactsKey.currentContext!);
          setState(() {
            isNavBarOpened = false;
          });
        },
        child: Text("Контакты", style: lightTextStyle(navBarTextSize)),
        style: ButtonStyle());
  }

  Widget applyTo() {
    return Container(
      height: 40,
      width: 190,
      decoration: BoxDecoration(
        color: Color(0xff0079D5),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: TextButton(
        onPressed: () {
          html.window.location.href = formLink;
        },
        child: Text(
          "Стать участником",
          style: normalTextStyle(normalTextSize),
        ),
      ),
    );
  }

  Widget applyToMk2() {
    return Container(
      width: 220,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1E88E5),
            Color(0xff0060B4),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: TextButton(
        onPressed: () {
          html.window.location.href = formLink;
        },
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
// заголовок лиц
// почта можно скопировать
