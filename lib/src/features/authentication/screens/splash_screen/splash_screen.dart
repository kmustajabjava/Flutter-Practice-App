import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import '../../../../common_widgets/fade_in_animation/animation_design.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1600,
            animate: TAnimatePosition(topAfter: 0, topBefore: -30,leftAfter: 0,leftBefore:-30,
            ),
            child: const Image(image: AssetImage(tSplashTopIcon),),
          ),
          TFadeInAnimation(
            durationInMs: 2000,
            animate: TAnimatePosition(topAfter: 80, topBefore: 80,leftAfter: tDefaultSize,leftBefore:-80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tAppName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  tAppTagLine,
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2400,
            animate: TAnimatePosition(bottomAfter: 100, bottomBefore: 0,
            ),
            child: const Image(image: AssetImage(tSplashImage),),
          ),
          TFadeInAnimation(
            durationInMs: 2400,
            animate: TAnimatePosition(bottomAfter: 100, bottomBefore: 0,
            ),
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: tPrimaryColor,
              ),
          ),
          ),
        ],
      ),
    );
  }
}

