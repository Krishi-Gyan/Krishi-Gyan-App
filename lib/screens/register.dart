import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:krishi_gyan/constants/exceptions.dart';
import 'package:krishi_gyan/provider/loginProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                 SizedBox(height: 1.5.h),
                Text(
                  'You have been missed!',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 6.h),

                //name text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 6.h,
                    width: 100.w,

                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0.mm)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                        ),
                      ),
                    ),
                  ),
                ),

                 SizedBox(height: 1.h),

                //mobile text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 6.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0.mm)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: mobileController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mobile',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),

                //email text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 6.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0.mm)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: emailController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                 SizedBox(height: 1.h),

                //password text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 6.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0.mm)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),

                 SizedBox(height: 3.h),

                //sign in
                SizedBox(
                  height: 6.h,
                  width: 90.w,
                  child: ElevatedButton(
                    onPressed: register,
                    child: const Text('Register'),
                    style: ElevatedButton.styleFrom(
                      elevation: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 3.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a member? '),
                    SizedBox(
                      
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(' SignIn Here!'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = nameController.text.trim();
    String mobile = mobileController.text.trim();

    if ([email, password, name, mobile].contains('')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the fields'),
        ),
      );
    }

    context
        .read<Login>()
        .register(email, password, name, mobile)
        .then((value) => Navigator.of(context)
            .pushNamedAndRemoveUntil("/bnb", (route) => false))
        .catchError((error) {
      String message = 'An unknown error occurred';
      if (error is ResgistrationException) {
        message = error.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}
