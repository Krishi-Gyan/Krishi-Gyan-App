// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const.dart';
import '../provider/loginProvider.dart';
import './signup_page.dart';

class LogInUp extends StatefulWidget {
  const LogInUp({Key? key}) : super(key: key);

  @override
  State<LogInUp> createState() => _LogInState();
}

class _LogInState extends State<LogInUp> {
  TextEditingController mobNoCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  bool passwordVisible = false;
  bool isLoading = false;

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

  void doesUserExist() async {
    if (mobNoCont.text.isEmpty && mobNoCont.text.length < 10) {
      showSnackBar('Please enter a valid mobile number...');
      return;
    }

    setState(() {
      isLoading = true;
    });
    await FirebaseFirestore.instance
        .collection('users')
        .where('mobile', isEqualTo: mobNoCont.text)
        .get()
        .then((QuerySnapshot value) async {
      if (value.size > 0) {
        await signInUsingPhoneNumber();
        return;
      }
      // user has not signed up take him to sign up page
      Navigator.pushNamed(context, '/sign_up');
      showSnackBar('You are not registered please signup first');
    });
  }

  Future<void> signInUsingPhoneNumber() async {
    String phoneNumber = "+91 ${mobNoCont.text}";

    await context.read<Login>().loginUsingPhoneNumber(
          phonenumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            showSnackBar('${e.message}');
            return;
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
          codeSent: (String verificationId, int? resendToken) {
            Navigator.pushNamed(context, '/otp', arguments: {
              'verificationCode': verificationId,
              'isSignUp': false
            });
          },
        );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.5.h,
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(children: [
                TextSpan(
                  text: 'Login to your \naccount',
                  style: GoogleFonts.judson(
                      fontWeight: FontWeight.bold,
                      fontSize: .44.dp,
                      color: greenTitle),
                ),
              ]),
            ),
            SizedBox(
              height: 3.h,
            ),
            TextField(
              controller: mobNoCont,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Mobile Number',
                disabledBorder: InputBorder.none,
                prefixText: "+91",
                counterText: '',
              ),
            ),
            const Spacer(
              flex: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: isLoading ? () {} : doesUserExist,
                  style: TextButton.styleFrom(
                    fixedSize: Size(37.w, 6.7.h),
                    backgroundColor: greenTitle,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0.sp),
                      ),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 1.0,
                      color: greenTitle,
                      style: BorderStyle.solid,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0.sp),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await context.read<Login>().signInWithGoogle();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/google_icon.png',
                      height: 5.h,
                      width: 27.w,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Center(
              child: RichText(
                text: TextSpan(
                  style: txtStyle,
                  children: <TextSpan>[
                    const TextSpan(
                      text: "Don't have an Account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const SignUp()),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
