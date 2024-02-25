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
      height: size.height * 0.22,
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
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // FaIcon(FontAwesomeIcons.sellcast),
                    Icon(
                      Icons.sell_sharp,
                      size: 20.sp,
                    ),
                    Text(
                      widget.product.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 0.3.h,
                    ),

                    Row(children: [
                      Text(
                        "₹" + widget.product.price.toString(),
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        widget.product.quantity.toString(),
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                    ]),

                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 4.h,
                      width: 30.w,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Icon(Icons.numbers),
                                content: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: 'Enter the Quantity',
                                      labelStyle: TextStyle(fontSize: 16.sp)),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16.sp),
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
                        child: Text(
                          'BUY',
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  height: 10.h,
                  width: 22.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.network(widget.product.imageLink).image,
                      fit: BoxFit.cover,
                    ),
                    // child: Align(
                    //     alignment: Alignment.centerRight,
                    //     child: Image.network(widget.product.imageLink),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
