//the tags in vendors (services)screen
import 'package:eventique/core/widget/category_tag_chip.dart';
import 'package:eventique/models/one_service.dart';
import 'package:flutter/material.dart';

final List<Color> colors = [
  Color(0XffF9EAE3),
  Color(0XffFFFADC),
  Color(0XffEDFCEA),
  Color(0XffFAF6F2),
  Color(0XffEEFAFF),
  Color(0XffFFCFDA)

];

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            ServiceCategories.values.length + 1, //  one for the 'All' category
        itemBuilder: (context, index) {
          if (index == 0) {
            return CategoryTag(
              title: 'All',
              color: Color(0XffFFE0D3),
            );
          } else {
            int enumIndex = index - 1;
            return CategoryTag(
              title: ServiceCategories.values[enumIndex].name,
              color: colors[enumIndex % colors.length],
            );
          }
        },
      ),
    );
  }
}
