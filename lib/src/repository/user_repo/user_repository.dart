import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/authentication/models/user_model.dart';

// User Rep to perform database operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //store user in firestore
  createUser(UserModel user) async {
    await _db.collection("User").add(user.toJson()).whenComplete(() {
      Get.snackbar(
        'Success',
        'Your account has been created.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    }).catchError((error, stackTrace) {
      Get.snackbar(
        'Error',
        'Something went wrong. Try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      printError(info: error.toString());
      return error;
    });
  }

  // fetch all user or user details from firestore
  Future<UserModel?> getUserDetails(String email) async {
    final snapshot = await _db.collection("User").where("Email", isEqualTo: email).get();

    if (snapshot.docs.isEmpty) {
      // Handle the case where no document is found
      printError(info: "No user found with email: $email");
      return null; // Return null if no document is found
    }
    // If exactly one document is found, return it
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }


  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("User").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async{
    await _db.collection("User").doc(user.id).update(user.toJson());
  }
}
