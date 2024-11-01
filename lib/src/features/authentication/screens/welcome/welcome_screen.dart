import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:practice_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:practice_app/src/constants/colors.dart';
import 'package:practice_app/src/constants/image_strings.dart';
import 'package:practice_app/src/constants/sizes.dart';
import 'package:practice_app/src/features/authentication/screens/login/login_screen.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../constants/text_strings.dart';
import '../signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tWhiteColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animate: TAnimatePosition(
              bottomAfter: 0,
              bottomBefore: -100,
              topBefore: 0,
              leftBefore: 0,
              rightBefore: 0,
              topAfter: 0,
              leftAfter: 0,
              rightAfter: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                      image: const AssetImage(tWelcomeScreenImage),
                      height: height * 0.6),
                  Column(
                    children: [
                      Text(tWelcomeTitle,
                          style: Theme.of(context).textTheme.displaySmall),
                      Text(tWelcomeSubTitle,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () =>Get.to(()=> const LoginScreen()),
                          child: Text(tLogin.toUpperCase()),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () =>Get.to(()=> const SignUpScreen()),
                          child: Text(tSignup.toUpperCase()),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
