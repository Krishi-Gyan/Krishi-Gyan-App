import 'package:flutter/material.dart';

const List<String> list1 = ['One', 'Two', 'Three', 'Four'];
const List<String> list2 = ['One', 'Two', 'Three', 'Four'];
const List<String> list3 = ['One', 'Two', 'Three', 'Four'];
const List<String> list4 = ['One', 'Two', 'Three', 'Four'];

class Recommendation extends StatefulWidget {
  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  String dropdownValue = list1.first;
  String dropdownValue2 = list2.first;
  String dropdownValue3 = list3.first;
  String dropdownValue4 = list3.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('landing_page_pic.png')),
      ),
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Fertilizers'),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Color.fromARGB(255, 36, 36, 36)),
              underline: Container(
                height: 2,
                color: const Color.fromARGB(255, 36, 36, 36),
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list1.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Pesticides'),
            DropdownButton<String>(
              value: dropdownValue2,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Color.fromARGB(255, 36, 36, 36)),
              underline: Container(
                height: 2,
                color: const Color.fromARGB(255, 36, 36, 36),
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue2 = value!;
                });
              },
              items: list2.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Irrigation'),
            DropdownButton<String>(
              value: dropdownValue3,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Color.fromARGB(255, 36, 36, 36)),
              underline: Container(
                height: 2,
                color: const Color.fromARGB(255, 36, 36, 36),
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue3 = value!;
                });
              },
              items: list3.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Crops recommended'),
            DropdownButton<String>(
              value: dropdownValue4,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Color.fromARGB(255, 36, 36, 36)),
              underline: Container(
                height: 2,
                color: const Color.fromARGB(255, 36, 36, 36),
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue4 = value!;
                });
              },
              items: list4.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
