import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class DashboardCourse {
  final String title;
  final String image;
  final String heading;
  final String subHeading;
  final VoidCallback onPress;

  DashboardCourse({
    required this.title,
    required this.image,
    required this.heading,
    required this.subHeading,
    required this.onPress,
  });

  static List<DashboardCourse> getCoursesList() {
    return [
      DashboardCourse(
        title: tCourse1,
        image: tTopCourseImage1,
        heading: tCourse1Section,
        subHeading: "34 Lessons",
        onPress: () {
          // Define your onPress action here
        },
      ),
      DashboardCourse(
        title: tCourse2,
        image: tTopCourseImage2,
        heading: tCourse2Section,
        subHeading: "30 Lessons",
        onPress: () {
          // Define your onPress action here
        },
      ),
      DashboardCourse(
        title: tCourse3,
        image: tTopCourseImage3,
        heading: tCourse3Section,
        subHeading: "30 Lessons",
        onPress: () {
          // Define your onPress action here
        },
      ),
    ];
  }
}
