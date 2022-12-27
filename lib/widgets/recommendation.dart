import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

const List<String> keys1 = ['One', 'Two', 'Three', 'Four'];
const List<String> keys2 = ['One', 'Two', 'Three', 'Four'];
const List<String> keys3 = ['One', 'Two', 'Three', 'Four'];

String selectedKey1 = 'Fertilizers';
String selectedKey2 = 'Pesticides';
String selectedKey3 = 'Irrigation Methods';

class Recommendation extends StatefulWidget {
  const Recommendation({Key? key}) : super(key: key);
  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          MenuButton<String>(
            child: normalChildButton1,
            items: keys1,
            itemBuilder: (String value) => Container(
              width: 300,
              height: 40,
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
              child: Text(value),
            ),
            toggledChild: Container(
              child: normalChildButton1,
            ),
            onItemSelected: (String value) {
              setState(() {
                selectedKey1 = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MenuButton<String>(
            child: normalChildButton2,
            items: keys2,
            itemBuilder: (String value) => Container(
              width: 300,
              height: 40,
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
              child: Text(value),
            ),
            toggledChild: Container(
              child: normalChildButton2,
            ),
            onItemSelected: (String value) {
              setState(() {
                selectedKey2 = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MenuButton<String>(
            child: normalChildButton3,
            items: keys3,
            itemBuilder: (String value) => Container(
              width: 300,
              height: 40,
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
              child: Text(value),
            ),
            toggledChild: Container(
              child: normalChildButton3,
            ),
            onItemSelected: (String value) {
              setState(() {
                selectedKey3 = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

final Widget normalChildButton1 = Container(
  width: 300,
  height: 40,
  decoration: const BoxDecoration(
    color: Color.fromARGB(255, 219, 236, 226),
  ),
  child: Padding(
    padding: const EdgeInsets.only(left: 16, right: 11),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(child: Text(selectedKey1, overflow: TextOverflow.ellipsis)),
        const SizedBox(
          width: 12,
          height: 17,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Icon(
              Icons.arrow_drop_down,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ],
    ),
  ),
);

final Widget normalChildButton2 = Container(
  width: 300,
  height: 40,
  decoration: const BoxDecoration(
    color: Color.fromARGB(255, 219, 236, 226),
  ),
  child: Padding(
    padding: const EdgeInsets.only(left: 16, right: 11),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(child: Text(selectedKey2, overflow: TextOverflow.ellipsis)),
        const SizedBox(
          width: 12,
          height: 17,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Icon(
              Icons.arrow_drop_down,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ],
    ),
  ),
);

final Widget normalChildButton3 = Container(
  width: 300,
  height: 40,
  decoration: const BoxDecoration(
    color: Color.fromARGB(255, 219, 236, 226),
  ),
  child: Padding(
    padding: const EdgeInsets.only(left: 16, right: 11),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(child: Text(selectedKey3, overflow: TextOverflow.ellipsis)),
        const SizedBox(
          width: 12,
          height: 17,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Icon(
              Icons.arrow_drop_down,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ],
    ),
  ),
);
