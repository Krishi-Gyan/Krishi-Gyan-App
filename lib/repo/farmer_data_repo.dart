import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FarmerDataRepo {
  final auth = FirebaseAuth.instance;

  Future<void> saveFarmDetails(String crop, String fert1, String fert2,
      String pest1, String pest2, String area) async {
    final String user_uid = auth.currentUser!.uid;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc("vAgx2RRmg7VIvqzUtn5KpCFqkoj2")
          // .doc(user_uid)
          .collection('farm_details')
          .add({
        'crop': crop,
        'fertilizer1': fert1,
        'fertilizer2': fert2,
        'pesticide1': pest1,
        'pesticide2': pest2,
        'area': area,
      });
    } catch (e) {
      debugPrint('Error saving farm details: $e');
    }
  }
}
