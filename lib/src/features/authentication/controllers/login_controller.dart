import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authenticate_repo.dart';
import '../../core/screens/dashboard/dashboard.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey= GlobalKey<FormState>();

  /// TextField Validation

  //Call this Function from Design & it will do the rest
  Future<void> login() async {
    if(loginFormKey.currentState!.validate()){
    String? error = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
    Get.offAll(()=>const Dashboard());
  }
}
}