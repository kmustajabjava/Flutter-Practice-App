import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/src/repository/user_repo/user_repository.dart';
import '../../../repository/authenticate_repo.dart';
import '../../core/screens/dashboard/dashboard.dart';
import '../models/user_model.dart';
import '../screens/forget_password/forget_passsword_otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo =Get.put(UserRepository());

  //Call this Function from Design & it will do the rest
  void registerUser(String email, String password) {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await AuthenticationRepository.instance.phoneAuthentication(phoneNo);
    Get.to(()=>const OTPScreen());
  }

  Future<void> createUser(UserModel user) async {
  await userRepo.createUser(user);
    // phoneAuthentication(user.phoneNo);
  }
}