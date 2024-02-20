import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:krishi_gyan/api.dart'; 
import 'package:krishi_gyan/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather/weather.dart';
import '../constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class KrishiGyan extends StatefulWidget {
  const KrishiGyan({Key? key}) : super(key: key);

  @override
  State<KrishiGyan> createState() => _KrishiGyanState();
}

class _KrishiGyanState extends State<KrishiGyan> {
  final WeatherFactory _wf = WeatherFactory("1234");
  Weather? _weather;
  String city = "delhi";

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName(city).then((value) {
      setState(() {
        _weather = value;
      });
    });
  }

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
              _weather == null
                  ? const Center(
                      child: SizedBox(),
                    )
                  : Container(
                      height: size.height * 0.30,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: lightGreen,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.sp),
                          bottomRight: Radius.circular(30.sp),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.sp, vertical: 20.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Weather",
                                    style: TextStyle(
                                      color: greenTitle,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          _weather?.areaName ?? "",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        Text(
                                          _weather?.date != null
                                              ? DateFormat('EEEE, dd-MM-yy')
                                                  .format(_weather!.date!)
                                              : "",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    _weather?.temperature.toString() ?? "",
                                    style: TextStyle(
                                      color: darkGreen,
                                      fontSize: 25.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.9.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Humidity",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        _weather?.humidity.toString() ?? "",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Wind Speed",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        _weather?.windSpeed.toString() ?? "",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Cloudiness",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        _weather?.cloudiness.toString() ?? "",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'HEADING\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                  style: GoogleFonts.inter(
                                      fontSize: 16.sp, color: Colors.black),
                                )
                              ],
                            ),
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
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'HEADING\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
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
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'HEADING\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
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
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'HEADING\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
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
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'HEADING\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
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
                        child: SingleChildScrollView(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'HEADING\n',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: darkGreen,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sapiente quibusdam quas reiciendis nisi quae assumenda quam ipsam molestiae obcaecati voluptatem, nam consequuntur',
                                  style: GoogleFonts.inter(color: Colors.black),
                                )
                              ],
                            ),
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
