import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/src/constants/image_strings.dart';
import 'package:practice_app/src/constants/sizes.dart';
import 'package:practice_app/src/constants/text_strings.dart';
import 'package:practice_app/src/features/authentication/controllers/login_controller.dart';
import 'package:practice_app/src/features/authentication/screens/login/google_login/social_button.dart';

class SocialFooterWidget extends StatelessWidget {
  const SocialFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Container(
      padding:
          const EdgeInsets.only(top: tDefaultSize, bottom: tDefaultSize),
      child: Column(
        children: [
          Obx(
            () => TSocialButton(
                text: tSignInWithGoogle,
                image: tGoogleLogoImage,
                foreground: Colors.white,
                background: Colors.blueAccent,
                isLoading: controller.isGoogleLoading.value ? true : false,
                onPressed: controller.isFacebookLoading.value || controller.isLoading.value
                    ? () {}
                    : ()=> controller.googleSignIn()),
          )
        ],
      ),
    );
  }
}
