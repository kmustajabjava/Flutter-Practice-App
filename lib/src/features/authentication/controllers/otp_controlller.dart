import 'package:get/get.dart';
import 'package:practice_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:practice_app/src/repository/authenticate_repo.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
        isVerified? Get.offAll(()=>const Dashboard()):Get.back();
  }
}
