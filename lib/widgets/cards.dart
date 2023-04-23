import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:krishi_gyan/constants/colors.dart';
import 'package:krishi_gyan/models/product.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FaIcon(FontAwesomeIcons.sellcast),
                const Icon(Icons.sell_sharp),
                Text(
                  widget.product.name,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Image.network(widget.product.imageLink)),

                const SizedBox(
                  height: 5,
                ),
                Row(children: [
                  Text(
                    "\$" + widget.product.price.toString(),
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.product.quantity.toString(),
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                ]),

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
