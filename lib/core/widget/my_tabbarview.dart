import 'package:eventique/core/widget/description.dart';
import 'package:eventique/core/widget/quantity_selector.dart';
import 'package:eventique/core/widget/rate_with_stars.dart';
import 'package:eventique/core/widget/reviews_grid.dart';
import 'package:eventique/core/widget/vendor_tile.dart';
import 'package:flutter/material.dart';

class MyTabBarView extends StatelessWidget {
  const MyTabBarView({
    super.key,
    required this.tabController,
    required this.serviceId,
    required this.description,
    required this.vendorname,
    required this.serviceCategory,
  });
  final TabController tabController;
  final int serviceId;
  final String description;
  final String vendorname, serviceCategory;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        // Tab 1 content
        SingleChildScrollView(
          child: Column(
            children: [
              VendorTile(
                vendorname: vendorname,
              ),
              (serviceCategory != 'venue' &&
                      serviceCategory != 'photography' &&
                      serviceCategory != 'transportation')
                  ? QuantitySelector(serviceId: serviceId)
                  : Container(),
              Description(
                description: description,
              ),
            ],
          ),
        ),
        // Tab 2 content
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RateWithStars(serviceId: serviceId),
            Expanded(
              child: ReviewsGrid(
                serviceId: serviceId,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
