import 'package:flutter/material.dart';
import 'package:krishi_gyan/widgets/recommendation.dart';
import 'package:krishi_gyan/screens/recom_screen.dart';

import 'screens/account_page.dart';
import 'screens/mandi.dart';

class BNB extends StatefulWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  State<BNB> createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  var selectedItem = 0;
  List children = [
    const Mandi(),
    const RecomScreen(),
    const Mandi(),
    const AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 25,
        currentIndex: selectedItem,
        unselectedLabelStyle: const TextStyle(color: Colors.green),
        unselectedItemColor: const Color.fromARGB(255, 84, 84, 84),
        selectedItemColor: const Color.fromARGB(255, 45, 114, 83),
        onTap: (currIndex) {
          setState(() {
            selectedItem = currIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.assignment_sharp),
            label: 'Krishi Gyan',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.info_outline),
            label: 'Recommendation',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Mandi',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
