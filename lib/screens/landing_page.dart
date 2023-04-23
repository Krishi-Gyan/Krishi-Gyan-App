import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishi_gyan/provider/loginProvider.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cropController = TextEditingController();
  void reg() {
    context
        .read<Login>()
        .register('test@gmail.com', "123456789", "test", "92928383748")
        .then((value) => null)
        .catchError((o) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.83,
              decoration: const BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    'KRISHI GYAN',
                    style: TextStyle(
                      color: darkGreen,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: _cropController,
                      decoration: InputDecoration(
                        fillColor: darkGreen,
                        filled: true,
                        hintText: 'Enter your name',
                        hintStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        fillColor: darkGreen,
                        filled: true,
                        hintText: 'Enter your phone number',
                        hintStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        fillColor: darkGreen,
                        filled: true,
                        hintText: 'Enter the crops your grow',
                        hintStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        fillColor: darkGreen,
                        filled: true,
                        hintText: 'Enter your permanent address',
                        hintStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: MaterialButton(
                      // onPressed: reg,
                      onPressed: () {
                        Navigator.pushNamed(context, '/bnb');
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      elevation: 5.0,
                      minWidth: 360,
                      color: darkGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(),
              child: const Text(
                'Call an expert',
                style: TextStyle(color: darkGreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
