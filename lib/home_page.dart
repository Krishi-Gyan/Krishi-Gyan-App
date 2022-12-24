import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krishi_gyan/bottom_navigation.dart';
import 'package:krishi_gyan/landing_page.dart';
import 'package:krishi_gyan/mandi.dart';

class HomePage extends StatelessWidget {
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
