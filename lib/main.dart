import 'package:flutter/material.dart';
import './recommendation.dart';

import 'home_page.dart';
import 'landing_page.dart';
import 'mandi.dart';
import './bottom_navigation.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp2(),
        routes: {
          '/lp': (context) => LandingPage(),
          '/hm': (context) => HomePage(),
          '/mp': (context) => mandi(),
          '/rp': (context) => Recommendation(),
          '/bnb': (context) => BNB(),
        });
  }
}

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}
