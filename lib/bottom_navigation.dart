import 'package:flutter/material.dart';
import 'package:krishi_gyan/screens/recommendation.dart';

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
    Recommendation(),
    const Mandi(),
    const AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 27, 26, 26),
        iconSize: 25,
        currentIndex: selectedItem,
        unselectedLabelStyle: const TextStyle(color: Colors.green),
        unselectedItemColor: Colors.white,
        onTap: (currIndex) {
          setState(() {
            selectedItem = currIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 27, 26, 26),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 27, 26, 26),
            icon: Icon(Icons.search),
            label: 'Krishi gyan',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 27, 26, 26),
            icon: Icon(Icons.shop),
            label: 'Mandi',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 27, 26, 26),
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
