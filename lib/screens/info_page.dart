import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../provider/loginProvider.dart';

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
    "Farm Area(sq km)"
  ];

  @override
  void dispose() {
    primFertCont.dispose();
    othFertCont.dispose();
    primPestCont.dispose();
    cNameCont.dispose();
    othPestCont.dispose();
    farmAreaCont.dispose();
    super.dispose();
  }

  void showSnackBar(String msg) {
    SnackBar snackbar = SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      // margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      dismissDirection: DismissDirection.horizontal,
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              color: greenTitle,
              iconSize: 23.sp,
              onPressed: () {
                Navigator.pushNamed(context, "/sign_up");
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
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter the details of a crop you grow",
                    style: GoogleFonts.roboto(fontSize: .29.dp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  txtfld(cNameCont, labelLst[0]),

                  txtfld(primFertCont, labelLst[1]),

                  txtfld(othFertCont, labelLst[2]),

                  txtfld(primPestCont, labelLst[3]),

                  txtfld(othPestCont, labelLst[4]),

                  txtfld(farmAreaCont, labelLst[5], type: TextInputType.phone),

                  // Row(
                  //   children: [
                  //     Text(
                  //       "Enter the details of a crop you grow",
                  //       style: GoogleFonts.roboto(fontSize: .28.dp),
                  //     ),
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         Icons.add_circle_outline,
                  //         color: greenTitle,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 1.h,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [imgCont(), imgCont(), imgCont()],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
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
                  Radius.circular(15.0.sp),
                ),
              ),
            ),
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () async {
              if (primFertCont.text.isEmpty) {
                showSnackBar('Primary Fertilizer is not valid...');
                return;
              }
              if (othFertCont.text.isEmpty) {
                showSnackBar('Please enter Other Fertilizer...');
                return;
              }
              if (cNameCont.text.isEmpty) {
                showSnackBar('Please enter Crop Name...');
                return;
              }
              if (primPestCont.text.isEmpty) {
                showSnackBar('Primary Pesticide is not valid...');
                return;
              }
              if (othPestCont.text.isEmpty) {
                showSnackBar('Please enter Other Pesticide...');
                return;
              }
              if (farmAreaCont.text.isEmpty) {
                showSnackBar('Please enter Farm Area...');
                return;
              }

              final userDetails = <String, dynamic>{
                "cropdata": {
                  "cropname": cNameCont.text,
                  "primaryfertilizer": primFertCont.text,
                  "otherfertilizer": othFertCont.text,
                  "primarypesticide": primPestCont.text,
                  "otherpesticide": othPestCont.text,
                  "farmarea": farmAreaCont.text,
                }
              };
              final ref = FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser?.uid);
              await ref
                  .update(userDetails)
                  // ignore: avoid_print
                  .onError((e, _) => print("Error writing document: $e"));

              if (context.mounted) {
                Navigator.pushNamed(
                  context,
                  '/bnb',
                );
              }
            },
            style: TextButton.styleFrom(
                fixedSize: Size(40.w, 7.h),
                backgroundColor: greenTitle,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0.sp)))),
            child: const Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
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

  txtfld(TextEditingController tempCont, String labelTxt,
      {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.5.h),
      child: TextField(
        keyboardType: type,
        controller: tempCont,
        cursorColor: greenTitle,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: greenTitle,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.sp),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: greenTitle.withOpacity(0.5),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.sp),
            ),
          ),
          labelText: labelTxt,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontWeight: FontWeight.w600, color: greenTitle),
        ),
      ),
    );
  }
}
