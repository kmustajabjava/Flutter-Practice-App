import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/src/constants/sizes.dart';
import 'package:practice_app/src/constants/text_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../repository/authenticate_repo.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;
  final isRememberMeChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadRememberedCredentials();
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      if (isRememberMeChecked.value) {
        saveCredentials();
      } else {
        clearCredentials();
      }

      auth.setInitialScreen(auth.firebaseUser);

    } catch (e) {
      isLoading.value = false;
      THelperFunctions.errorSnackBar(title: tOhSnap, message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      isGoogleLoading.value = true;
      final auth = AuthenticationRepository.instance;
      await auth.signInWithGoogle();
      isGoogleLoading.value = false;
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isGoogleLoading.value = false;
      THelperFunctions.errorSnackBar(title: tOhSnap, message: e.toString());
    }
  }

  void toggleRememberMe() {
    isRememberMeChecked.value = !isRememberMeChecked.value;
  }

  void saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email.text);
    await prefs.setString('password', password.text);
  }

  void loadRememberedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    email.text = prefs.getString('email') ?? '';
    password.text = prefs.getString('password') ?? '';
    isRememberMeChecked.value = email.text.isNotEmpty && password.text.isNotEmpty;
  }

  void clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
  }
}
