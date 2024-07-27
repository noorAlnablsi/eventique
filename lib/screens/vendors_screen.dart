import 'package:eventique/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:eventique/widgets/categories_list.dart';
import 'package:eventique/widgets/services_grid.dart';
import 'search_results_screen.dart'; // Import the new search results screen

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchResultsScreen()),
                  );
                },
                child: MySearchBar(
                  enabled: false,
                ),
              ),
              const CategoriesList(),
              ServicesGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
