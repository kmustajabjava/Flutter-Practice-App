import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

const tDefaultSize = 30.0;
const tSplashContainerSize = 30.0;
const tButtonHeight = 15.0;
const tFormHeight = 30.0;
const double spaceBtwItems = 16.0;

const tDashboardPadding = 20.0;
const tDashboardCardPadding = 10.0;

class THelperFunctions {
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static successSnackBar({required title, message = '', duration=3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: tAccent1Color,
      duration: Duration(seconds: duration),
      snackPosition:SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.check, color: tWhiteColor,),
    );
  }

  static warningSnackBar({required title, message = '', duration=3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.orange,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning_amber, color: tWhiteColor,),
      snackPosition:SnackPosition.BOTTOM,
    );
  }

  static errorSnackBar({required title, message = '', duration=3}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning_amber, color: tWhiteColor,),
      snackPosition:SnackPosition.BOTTOM,
    );
  }
}
