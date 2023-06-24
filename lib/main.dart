
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/_myColors.dart';
import 'package:techblog/view/_Splashscrn.dart';
// import 'package:techblog/view/_Splashscrn.dart';
// import 'package:techblog/view/goToLogin.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: solidcolors.statusBarcolor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: solidcolors.statusBarcolor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // persian
      ],
      theme: ThemeData(
        fontFamily: 'dana',
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: 'danaBold',
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: solidcolors.posterTitle),
            subtitle1: TextStyle(
                fontFamily: 'danaLight',
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: solidcolors.posterSubtitle),
            headline2: TextStyle(
                fontFamily: 'danaLight',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: (Color.fromARGB(255, 255, 255, 255))),
            subtitle2: TextStyle(
                fontFamily: 'danaLight',
                fontSize: 15.5,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 11, 11, 11)),
            headline3: TextStyle(
                fontFamily: 'danaLight',
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 40, 107, 174)),
            headline4: TextStyle(
                fontFamily: 'danaBold',
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Color.fromARGB(255, 15, 15, 15))),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

