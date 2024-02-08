import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class infoPage extends StatefulWidget {
  @override
  State<infoPage> createState() => _infoPageState();
}

class _infoPageState extends State<infoPage> {
  TextEditingController primFertCont = TextEditingController();
  TextEditingController othFertCont = TextEditingController();
  TextEditingController primPestCont = TextEditingController();
  TextEditingController othPestCont = TextEditingController();
  TextEditingController farmAreaCont = TextEditingController();
  TextEditingController cNameCont = TextEditingController();

  List<String> labelLst = [
    "Crop Name",
    "Primary Fertilizer used",
    "Other Fertilizer used",
    "Primary Pesticide used",
    "Other Pesticide used",
    "Area of farm"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.5.h),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    color: greenTitle,
                    iconSize: 23.sp,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(height: 2.h),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Enter your farm \ndetails',
                          style: GoogleFonts.judson(
                              fontWeight: FontWeight.bold,
                              fontSize: .4.dp,
                              color: greenTitle),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Enter the details of a crop you grow",
                    style: GoogleFonts.roboto(fontSize: .29.dp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  txtfld(cNameCont, labelLst[0]),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  txtfld(primFertCont, labelLst[1]),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  txtfld(othFertCont, labelLst[2]),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  txtfld(primPestCont, labelLst[3]),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  txtfld(othPestCont, labelLst[4]),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  txtfld(farmAreaCont, labelLst[5]),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Enter the details of a crop you grow",
                        style: GoogleFonts.roboto(fontSize: .28.dp),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: greenTitle,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [imgCont(), imgCont(), imgCont()],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/bnb',
                          );
                        },
                        style: TextButton.styleFrom(
                            fixedSize: Size(40.w, 7.h),
                            backgroundColor: greenTitle,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0.sp)))),
                        child: const Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          fixedSize: Size(40.w, 7.h),
                          backgroundColor: greenTitle,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0.sp),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Add another crop',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  imgCont() {
    return Container(
      height: 12.5.h,
      width: 27.5.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 189, 186, 186),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0.sp),
        ),
      ),
    );
  }

  txtfld(TextEditingController tempCont, String labelTxt) {
    return TextField(
      controller: tempCont,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 8,
              color: Color.fromARGB(255, 45, 114, 84),
              style: BorderStyle.solid),
          borderRadius: BorderRadius.all(
            Radius.circular(15.sp),
          ),
        ),
        labelText: labelTxt,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
