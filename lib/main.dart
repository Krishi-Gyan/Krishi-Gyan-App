import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:krishi_gyan/screens/info_page.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'firebase_options.dart';
import 'screens/home_page.dart';
import 'screens/_old_landing_page.dart';
import 'screens/mandi.dart';
import 'screens/bottom_navigation.dart';
import 'provider/loginProvider.dart';
import 'provider/databaseProvider.dart';
import 'screens/login_page.dart';
import 'screens/otp_page.dart';
import 'screens/recom_screen.dart';
import 'screens/_old_register_page.dart';
import 'widgets/check_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>(
          create: (context) => Login().userChange,
          initialData: null,
        ),
        ChangeNotifierProvider<Login>(
          create: (context) => Login(),
        ),
        ChangeNotifierProvider<DatabaseProvider>(
          create: (context) => DatabaseProvider(),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MainApp();
        },
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CheckLogin(),
      routes: {
        '/lp': (context) => const LandingPage(),
        '/hm': (context) => const HomePage(),
        '/mp': (context) => const Mandi(),
        '/rp': (context) => const RecomScreen(),
        '/bnb': (context) => const BNB(),
        '/sign_in': (context) => const LogInUp(),
        '/register': (context) => const Register(),
        '/otp': (context) => const OtpPage(),
        '/info': (context) => infoPage(),
      },
    );
  }
}
