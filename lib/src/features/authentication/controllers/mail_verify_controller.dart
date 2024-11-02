import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:practice_app/src/constants/sizes.dart';
import 'package:practice_app/src/constants/text_strings.dart';
import 'package:practice_app/src/repository/authenticate_repo.dart';

class MailVerificationController extends GetxController{
  late Timer timer;

  @override
  void onInit(){
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoDirect();
  }

  Future<void> sendVerificationEmail() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
    }catch(e){
THelperFunctions.errorSnackBar(title: tOhSnap,message: e.toString());
    }
  }

  void manuallyCheckEmailVerificationStatus() {
    FirebaseAuth.instance.currentUser?.reload();
    final user =FirebaseAuth.instance.currentUser;
    if(user!.emailVerified){
      AuthenticationRepository.instance.setInitialScreen(user);
    }
  }

  void setTimerForAutoDirect() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified){
        timer.cancel();
        AuthenticationRepository.instance.setInitialScreen(user);
      }
    });
  }
}
