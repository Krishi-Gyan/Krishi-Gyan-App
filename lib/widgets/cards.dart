import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class cards extends StatefulWidget {
  @override
  State<cards> createState() => _cardsState();
}

class _cardsState extends State<cards> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      height: size.height * 0.25,
      width: size.width * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.black26
                  // gradient: const LinearGradient(
                  //   // colors: [
                  //   //   Color.fromARGB(255, 1, 115, 116),
                  //   //   Color.fromARGB(255, 1, 162, 153),
                  //   // ],
                  // ),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FaIcon(FontAwesomeIcons.sellcast),
                  Icon(Icons.sell_sharp),
                  Text(
                    'Lorem ipsum',
                    style: GoogleFonts.jost(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Lorem ipsum',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Lorem ipsum',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Icon(Icons.numbers),
                            content: TextField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Enter the Quantity',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Confirm',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(

                        // backgroundColor: const Color.fromARGB(255, 36, 35, 35),
                        ),
                    child: const Text('BUY'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
