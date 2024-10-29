import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final String phoneNo;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNo,
  });

  //mapping data to json approach
  toJson() {
    return {
      "FullName": fullName,
      "Email": email.toLowerCase(),
      "Phone": phoneNo,
      "Password": password,
    };
  }

  //mapping user fetched from firebase to user model
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullName: data["FullName"],
        email: data["Email"],
        password: data["Password"],
        phoneNo: data["Phone"]);
  }
}
