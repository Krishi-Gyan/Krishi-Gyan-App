import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:krishi_gyan/screens/recommendation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/home_page.dart';
import 'screens/landing_page.dart';
import 'screens/mandi.dart';
import 'widgets/bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, user) {
        if (user.data != null) {
          return BNB();
        }
        return LandingPage();
      },
    );
  }
}
