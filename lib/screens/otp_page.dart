import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishi_gyan/provider/loginProvider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const.dart';
import './info_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _pinInputController = TextEditingController();

  Future<void> _verifyAndLogin(String smsCode, String verificationId) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> setData(
      String name, String mobile, String address, String aadhar) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'mobile': mobile,
      'address': address,
      'aadhar': aadhar,
    });
  }

  void showSnackBar(String msg) {
    SnackBar snackbar = SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.5.h),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  color: greenTitle,
                  iconSize: 0.35.dp,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Verify your account',
                        style: GoogleFonts.judson(
                          fontWeight: FontWeight.bold,
                          fontSize: .37.dp,
                          color: greenTitle,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Center(
              child: Pinput(
                length: 6,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsRetrieverApi,
                controller: _pinInputController,
                defaultPinTheme: PinTheme(
                  width: 15.w,
                  height: 7.h,
                  textStyle: TextStyle(
                      fontSize: .35.dp,
                      color: const Color.fromRGBO(30, 60, 87, 1),
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    border: Border.all(color: greenTitle),
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                ),
                onCompleted: (String otp) async {
                  Map<String, dynamic> argsMap =
                      arguments as Map<String, dynamic>;

                  await _verifyAndLogin(
                    _pinInputController.text,
                    argsMap['verificationCode']!,
                  ).then((value) async {
                    if (arguments['isSignUp'] == true) {
                      context.read<Login>().userData = {
                        "adhaar": argsMap['aadhar'],
                        "mobile": argsMap['mobile'],
                        "name": argsMap['name'],
                        "city": argsMap['city'],
                        "state": argsMap['state'],
                        "cropdata": {},
                      };
                      final ref = FirebaseFirestore.instance
                          .collection("users")
                          .doc(FirebaseAuth.instance.currentUser?.uid);

                      await ref.set(context.read<Login>().userData).onError(
                          (e, _) => print("Error writing document: $e"));
                    } else {
                      print("-----------------------------");
                      print("IN ELSE PART");
                      final ref = FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser?.uid);
                      await ref.get().then((DocumentSnapshot doc) {
                        final map = doc.data() as Map<String, dynamic>;
                        if (map['cropdata'] == {}) {
                          print("CROP DATA IS NULL");
                          // user has not given crop data take to info page
                          if (context.mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/info',
                              (route) => false,
                            );
                          }
                        } else {
                          print("CROP DATA IS NOT NULL");
                          if (context.mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/bnb',
                              (route) => false,
                            );
                          }
                        }
                      }, onError: (err, _) {
                        // ignore: avoid_print
                        print("Error getting document: $err");
                      });
                    }
                  }, onError: (err, _) {
                    showSnackBar(
                        'Something went wrong while verifying the otp...');
                  });
                },
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => infoPage()),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  fixedSize: Size(45.w, 7.5.h),
                  backgroundColor: greenTitle,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0.sp),
                    ),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
