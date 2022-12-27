import 'package:flutter/material.dart';
import 'package:krishi_gyan/widgets/recommendation.dart';

class RecomScreen extends StatefulWidget {
  const RecomScreen({Key? key}) : super(key: key);

  @override
  State<RecomScreen> createState() => _RecomScreenState();
}

class _RecomScreenState extends State<RecomScreen> {
  PageController? pageViewController;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return const Recommendation();
  }
}
