import 'package:eventique/widgets/categories_list.dart';
import 'package:eventique/widgets/search_bar.dart';
import 'package:eventique/widgets/services_grid.dart';
import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MySearchBar(),
              const CategoriesList(),
              ServicesGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
