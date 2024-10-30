import 'dart:ui';

class CategoryItem {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback onPress;

  CategoryItem({
    required this.title,
    required this.heading,
    required this.subHeading,
    required this.onPress,
  });

  static List<CategoryItem> getData() {
    return [
      CategoryItem(
        title: "JS",
        heading: "JavaScript",
        subHeading: "10 Lessons",
        onPress: () {
          // print("Pressed JS");
        },
      ),
      CategoryItem(
        title: "Fl",
        heading: "Flutter",
        subHeading: "12 Lessons",
        onPress: () {
          // print("Pressed Flutter");
        },
      ),
      CategoryItem(
        title: "H",
        heading: "HTML",
        subHeading: "4 Lessons",
        onPress: () {
          // print("Pressed HTML");
        },
      ),
      CategoryItem(
        title: "K",
        heading: "Kotlin",
        subHeading: "15 Lessons",
        onPress: () {
          // print("Pressed Kotlin");
        },
      ),
      CategoryItem(
        title: "P",
        heading: "Python",
        subHeading: "15 Lessons",
        onPress: () {
          // print("Pressed Python");
        },
      ),

    ];
  }
}