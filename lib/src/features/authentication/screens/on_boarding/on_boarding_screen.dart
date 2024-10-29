import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/src/constants/image_strings.dart';
import 'package:practice_app/src/constants/text_strings.dart';
import 'package:practice_app/src/features/authentication/controllers/on_boarding_controller.dart';
import 'on_board_page_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller:controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: tOnBoardingImage1,
                title: tOnBoardingTitle1,
                subTitle: tOnBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: tOnBoardingImage2,
                title: tOnBoardingTitle2,
                subTitle: tOnBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: tOnBoardingImage3,
                title: tOnBoardingTitle3,
                subTitle: tOnBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

