import 'package:eventique/widgets/one_review.dart';
import 'package:eventique/widgets/rate_with_stars.dart';
import 'package:eventique/providers/reviews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewsGrid extends StatelessWidget {
  const ReviewsGrid({super.key, required this.serviceId});
  final int serviceId;

  @override
  Widget build(BuildContext context) {
    final reviewsProvider = Provider.of<Reviews>(context);
    
    // Trigger the data fetching when the widget is built.
    if (reviewsProvider.reviewsForService(serviceId).isEmpty) {
      reviewsProvider.getReviewsForService(serviceId);
    }

    final listOfReviews = reviewsProvider.reviewsForService(serviceId);

    return ListView.builder(
      itemCount: listOfReviews.length + 1,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return (index == 0)
            ? RateWithStars(serviceId: serviceId)
            : OneReview(
                imgurl: listOfReviews[index - 1].imgurl,
                personName: listOfReviews[index - 1].personName,
                rating: listOfReviews[index - 1].rating,
                theComment: listOfReviews[index - 1].theComment,
                serviceId: serviceId,
                reviewIndex: index - 1,
                personId:listOfReviews[index - 1].personId
              );
      },
    );
  }
}

