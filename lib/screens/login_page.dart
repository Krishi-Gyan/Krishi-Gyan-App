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

  Future<void> signInUsingPhoneNumber() async {
    String phoneNumber = "+91 ${mobNoCont.text}";

    if (mobNoCont.text.length < 10) {
      showSnackBar('Mobile number is not valid...');
      return;
    }

    await context
        .read<Login>()
        .loginUsingPhoneNumber(
          phonenumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            showSnackBar('${e.message}');
            return;
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
          codeSent: (String verificationId, int? resendToken) {
            Navigator.pushNamed(
              context,
              '/otp',
              arguments: {'verificationCode': verificationId, 'name': null},
            );
          },
        )
        .then((value) {
      Navigator.pushNamed(
        context,
        '/otp',
      );
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
                  onPressed: () async {
                    await signInUsingPhoneNumber();
                  },
                  style: TextButton.styleFrom(
                    fixedSize: Size(37.w, 6.7.h),
                    backgroundColor: greenTitle,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0.sp),
                      ),
                    ),
                  ),
                  child: const Text(
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
                  onPressed: () {},
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
