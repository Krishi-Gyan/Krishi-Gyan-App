import 'package:flutter/material.dart';
import './recommendation.dart';

import 'home_page.dart';
import 'landing_page.dart';
import 'mandi.dart';
import './bottom_navigation.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyApp2(),
        routes: {
          '/lp': (context) => const LandingPage(),
          '/hm': (context) => const HomePage(),
          '/mp': (context) => const Mandi(),
          '/rp': (context) => Recommendation(),
          '/bnb': (context) => const BNB(),
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
    return const LandingPage();
  }
}
