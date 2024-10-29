import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
