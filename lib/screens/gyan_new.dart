import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constants/colors.dart';

class KrishiGyan extends StatefulWidget {
  const KrishiGyan({Key? key}) : super(key: key);

  @override
  State<KrishiGyan> createState() => _KrishiGyanState();
}

class _KrishiGyanState extends State<KrishiGyan> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Krishi Gyan',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
          ),
          backgroundColor: darkGreen,
          toolbarHeight: size.height * 0.05,
          elevation: 0,
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50.sp),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.35,
                width: size.width,
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.sp),
                    bottomLeft: Radius.circular(30.sp),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Text(
                  "Krishi Gyan",
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              Container(
                padding: EdgeInsets.all(3.w),
                height: size.height * 0.25,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6.w),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'HEADING\n',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(25.sp),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'HEADING\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                style: TextStyle(),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'HEADING\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                style: TextStyle(),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Government Schemes",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: size.height * 0.25,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'HEADING\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                style: TextStyle(),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'HEADING\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                style: TextStyle(),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.2,
                        width: size.width * 0.7,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'HEADING\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                style: TextStyle(),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
