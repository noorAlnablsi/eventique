import 'package:eventique/core/widget/one_review.dart';
import 'package:eventique/providers/reviews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewsGrid extends StatelessWidget {
  const ReviewsGrid({super.key, required this.serviceId});
  final int serviceId;

  @override
  Widget build(BuildContext context) {
    final listOfReviews =
        Provider.of<Reviews>(context).getReviewsForService(serviceId);
    return
    //  listOfReviews.isEmpty
    //     ? Text(
    //         'No Reviews Are Available',
    //         style: Theme.of(context).textTheme.bodySmall!.copyWith(
    //               fontFamily: 'IrishGrover',
    //               fontSize: 22,
    //               color: Theme.of(context).primaryColor.withOpacity(0.3),
    //             ),
    //       )
    //     : 
        ListView.builder(
            itemCount: listOfReviews.length,
            itemBuilder: (BuildContext context, int index) {
              return OneReview(
                imgurl:listOfReviews[index].imgurl ,
                personName:listOfReviews[index].personName ,
                rating: listOfReviews[index].rating,
                theComment:listOfReviews[index].theComment ,
                serviceId: serviceId,
                reviewIndex:index,
              );
            },
          );
  }
}
