import 'package:eventique/widget/categories_list.dart';
import 'package:eventique/widget/search_bar.dart';
import 'package:eventique/widget/services_grid.dart';
import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MySearchBar(),
            const CategoriesList(),
            ServicesGrid(),
          ],
        ),
      ),
    );
  }
}
