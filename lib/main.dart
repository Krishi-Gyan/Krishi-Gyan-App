import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:krishi_gyan/provider/databaseProvider.dart';
import 'package:krishi_gyan/screens/recom_screen.dart';
import 'package:krishi_gyan/screens/register.dart';
import 'package:krishi_gyan/screens/sign-in-page.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'screens/landing_page.dart';
import 'screens/mandi.dart';
import './bottom_navigation.dart';
import './provider/loginProvider.dart';
import 'firebase_options.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
              create: (context) => Login().userChange, initialData: null),
          ChangeNotifierProvider<Login>(
            create: (context) => Login(),
          ),
          ChangeNotifierProvider<DatabaseProvider>(
            create: (context) => DatabaseProvider(),
          ),
        ],
        child: ResponsiveSizer(builder: (context, orientation, screenType) {
          return const MainApp();
        }));
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
        initialRoute:
            context.read<Login>().currentUser == null ? '/sign_in' : '/bnb',
        routes: {
          '/lp': (context) => const LandingPage(),
          '/hm': (context) => const HomePage(),
          '/mp': (context) => const Mandi(),
          '/rp': (context) => const RecomScreen(),
          '/bnb': (context) => const BNB(),
          '/sign_in': (context) => const LoginPage(),
          '/register': (context) => const Register(),
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
