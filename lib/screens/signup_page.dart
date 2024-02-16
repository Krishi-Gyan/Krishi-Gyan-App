import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../provider/loginProvider.dart';
import '../const.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController mobNoCont = TextEditingController();
  TextEditingController aadCont = TextEditingController();
  TextEditingController addCont = TextEditingController();
  TextEditingController nameCont = TextEditingController();

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

    if (aadCont.text.length < 12) {
      showSnackBar('Aadhar number is not valid...');
      return;
    }

    await context.read<Login>().loginUsingPhoneNumber(
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
              arguments: {
                'verificationCode': verificationId,
                'name': nameCont.text.trim(),
                'address': addCont.text.trim(),
                'aadhar': aadCont.text,
                'mobile': mobNoCont.text,
              },
            );
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.5.h),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Create your\naccount',
                      style: GoogleFonts.judson(
                        fontWeight: FontWeight.bold,
                        fontSize: .44.dp,
                        color: greenTitle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.45.h,
              ),
              TextField(
                controller: nameCont,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Name',
                  disabledBorder: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: mobNoCont,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Mobile Number',
                  disabledBorder: InputBorder.none,
                  counterText: '',
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: aadCont,
                keyboardType: TextInputType.number,
                maxLength: 12,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Adhaar Number',
                  disabledBorder: InputBorder.none,
                  counterText: '',
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: addCont,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'City',
                  disabledBorder: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                controller: addCont,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'State',
                  disabledBorder: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Upload your photo',
                      style: TextStyle(
                          color: greenTitle,
                          fontSize: .27.dp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat"),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ),
                  Container(
                    height: 11.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0.sp),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 23.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () async => await signInUsingPhoneNumber(),
                    style: TextButton.styleFrom(
                      fixedSize: Size(33.w, 6.8.h),
                      backgroundColor: greenTitle,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0.sp),
                        ),
                      ),
                    ),
                    child: const Text(
                      'SignUp',
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
                        width: 23.w,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: txtStyle,
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Already have an Account? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: linkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
