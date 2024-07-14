//changes to find error
//commented tab 2


import 'package:eventique/widget/description.dart';
import 'package:eventique/widget/quantity_selector.dart';
import 'package:eventique/widget/rate_with_stars.dart';
import 'package:eventique/widget/reviews_grid.dart';
import 'package:eventique/widget/vendor_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     // RateWithStars(serviceId: serviceId),

        //     Expanded(
        //       child: ReviewsGrid(
        //         serviceId: serviceId,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
