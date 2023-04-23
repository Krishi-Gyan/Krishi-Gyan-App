import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishi_gyan/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyCards extends StatefulWidget {
  const MyCards({Key? key}) : super(key: key);
  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      // margin: const EdgeInsets.all(10),
      height: size.height * 0.28,
      width: size.width * 0.8,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              border: Border.all(color: darkGreen),
              borderRadius: BorderRadius.all(
                Radius.circular(10.w),
              ),
              color: Colors.transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FaIcon(FontAwesomeIcons.sellcast),
                // const Icon(Icons.sell_sharp,size: 10,),
                Text(
                  'Lorem ipsum',
                  style: GoogleFonts.jost(color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: const [
                    Text(
                      'Lorem ipsum',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Lorem ipsum',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 4.h,
                  width: 20.w,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Icon(Icons.numbers),
                            content: const TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
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
                      backgroundColor: darkGreen,
                    ),
                    child: const Text('BUY'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
