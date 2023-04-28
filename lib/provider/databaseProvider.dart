import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../models/product.dart';

const uuid = Uuid();

class DatabaseProvider extends ChangeNotifier {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;

  Stream<List<Product>> getProducts() {
    return firestore.collection('market').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromMap(doc.data())).toList());
  }

  Future<Product> createProduct(
    String name,
    int price,
    int quantity,
    File imageFile,
  ) async {
    final user = auth.currentUser;

    // If user's not logged in
    if (user == null) {
      throw Exception('User not found');
    }

    // Upload file to firebase storage
    String downloadUrl = await _uploadFileToFirebase(imageFile);

    // Now that the image is uploaded successfully, we create a document
    // First we need logged in user's uuid
    // Assuming that the user is logged in:
    final String sellerUuid = auth.currentUser!.uid;

    Map<String, dynamic> productMap = {
      "sellerUuid": sellerUuid,
      "name": name,
      "quantity": quantity,
      "price": price,
      "imageLink": downloadUrl,
      // Empty buyerUuid represents that the item is not sold yet
      "buyerUuid": "",
      "id": uuid.v1(),
    };

    await firestore.collection("market").add(productMap);
    return Product.fromMap(productMap);
  }

  Future<String> _uploadFileToFirebase(File file) async {
    final storageRef = FirebaseStorage.instance.ref();

    final imageRef = storageRef.child('productImages/${uuid.v1()}');

    await imageRef.putFile(file);

    final String downloadUrl = await imageRef.getDownloadURL();

    return downloadUrl;
  }

  Future<void> buyProduct(String productId) async {
    // If user's not logged in
    if (auth.currentUser == null) {
      throw Exception('User not found');
    }

    // Assuming that the user is logged in:
    final String buyerUuid = auth.currentUser!.uid;

 try {
   await firestore
        .collection('market')
        .doc(productId)
        .update({'buyerUuid': buyerUuid});

    await firestore.collection('users').doc(buyerUuid).update({
      "orderHistory": FieldValue.arrayUnion([productId])
    });
   
 } catch (e) {
   
 }
   
  }
}
