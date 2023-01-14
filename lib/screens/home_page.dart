import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krishi_gyan/widgets/bottom_navigation.dart';
import 'package:krishi_gyan/screens/landing_page.dart';
import 'package:krishi_gyan/screens/mandi.dart';

// comment here
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
