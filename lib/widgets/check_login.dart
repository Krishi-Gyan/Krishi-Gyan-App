import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishi_gyan/screens/login_page.dart';
import 'package:provider/provider.dart';

import '../provider/loginProvider.dart';
import '../screens/bottom_navigation.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<Login>().userChange,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const BNB();
        }
        return const LogInUp();
      },
    );
  }
}
