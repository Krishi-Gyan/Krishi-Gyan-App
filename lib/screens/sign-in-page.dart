import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:krishi_gyan/models/http_exception.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _message = 'no data';
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> _signUpUsingEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        throw HttpException('Password is too weak');
      }
      if (error.code == 'email-already-in-use') {
        throw HttpException('Email already in use');
      }
    } catch (_) {
      throw HttpException('Something went wrong!');
    }
  }

  Future<void> _signUpUsingGoogleAccount() async {
    GoogleSignInAccount? googleAccount = await GoogleSignIn(
      scopes: [
        'email',
        'profile',
      ],
    ).signIn();

    if (googleAccount == null) {
      throw HttpException(
          'Something went wrong while authenticating with google');
    }

    final googleAuth = await googleAccount.authentication;

    final userCred = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    await FirebaseAuth.instance.signInWithCredential(userCred);
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    SnackBar snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  style: GoogleFonts.kufam(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'You have been missed!',
                  style: GoogleFonts.bentham(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),

                //email text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //password text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                //sign in
                SizedBox(
                  height: 50,
                  width: 375,
                  child: ElevatedButton(
                    onPressed: () {
                      bool error = false;
                      _signUpUsingEmailPassword(
                        emailController.text,
                        passwordController.text,
                      ).catchError((err) {
                        error = true;
                        _showSnackBar(err.toString());
                      });
                      if (!error) {
                        Navigator.pushNamed(context, '/lp');
                      }
                    },
                    child: const Text('Sign In'),
                    style: ElevatedButton.styleFrom(
                      elevation: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Container(
                //     padding: EdgeInsets.all(20.0),
                //     decoration: BoxDecoration(
                //         color: Colors.blue,
                //         borderRadius: BorderRadius.circular(12)),
                //     child: Center(
                //       child: Text(
                //         'Sign In',
                //         style: GoogleFonts.basic(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 18,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 20),

                //not a member

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a Member? '),
                    SizedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/second');
                        },
                        child: const Text(' Register Here!'),
                      ),

                      //   style: TextStyle(
                      //       color: Colors.blue, fontWeight: FontWeight.bold),
                      // ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.topCenter,
                          height: 40,
                          child: IconButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed('/lp'),
                            icon: const Icon(
                              Icons.facebook,
                              size: 50,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 23, 10, 10),
                          height: 60,
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () {
                              _signUpUsingGoogleAccount().catchError((error) {
                                _showSnackBar(error.toString());
                              });
                              Navigator.of(context).pushNamed('/lp');
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                              size: 45,
                            ),
                          ),
                        )
                      ],
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
}
