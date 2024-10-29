import 'package:flutter/material.dart';
import 'package:practice_app/src/constants/sizes.dart';
import 'package:practice_app/src/constants/text_strings.dart';
import 'package:practice_app/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:practice_app/src/features/core/screens/dashboard/widgets/banner.dart';
import 'package:practice_app/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:practice_app/src/features/core/screens/dashboard/widgets/searchbar.dart';
import 'package:practice_app/src/features/core/screens/dashboard/widgets/top_courses.dart';
import '../../../../constants/colors.dart';
import '../../models/dashboard/categories_model.dart';
import '../../models/dashboard/dashboard_courses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(tDashboardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tDashboardTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              tDashboardHeading,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: tDashboardPadding,
            ),
            const DashBoardSearchBox(),
            const SizedBox(
              height: tDashboardPadding,
            ),
            DashboardCategories(
              list: CategoryItem.getData(),
              txtTheme: txtTheme,
              tDarkColor: tDarkColor,
            ),
            const SizedBox(
              height: tDashboardPadding,
            ),
            DashboardBanner(
              txtTheme: txtTheme,
            ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0),
               child: Text(
                 tDashboardTopCourses,
                 style: Theme.of(context).textTheme.displayMedium,
               ),
             ),
            DashboardCourses(
              txtTheme: txtTheme,
              list: DashboardCourse.getCoursesList(),
            ),
          ],
        ),
      )),
    );
  }
}
