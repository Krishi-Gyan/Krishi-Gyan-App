import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  Stream<User?> get userChange {
    return auth.authStateChanges();
  }

  Future<User> register(
      String email, String password, String name, String mobile) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = auth.currentUser;
      notifyListeners();
      _createNewUserInFirestore(name, email, mobile);
      return user!;
    } catch (e) {
      // ignore: avoid_print
      throw Exception('');
    }
  }

  Future signOutFunction() async {
    try {
      return await auth.signOut();
    } catch (e) {
      throw Exception('');
    }
  }

  Future<User> signIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      notifyListeners();
      return user!;
    } catch (e) {
      throw Exception('');
    }
  }

  void _createNewUserInFirestore(String name, String email, String mobile) {
    final CollectionReference<Map<String, dynamic>> usersRef =
        FirebaseFirestore.instance.collection('users');
    usersRef.doc(user?.uid).set({
      'id': user?.uid,
      'name': name,
      'email': email,
      'mobile': mobile,
      // 'timestamp': documentIdFromCurrentDate(),
    });
  }
}
