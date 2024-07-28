
import 'package:eventique/models/one_review.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Reviews with ChangeNotifier {
  Map<int, double> _currentRatings = {};

  final Map<int, List<OneReview>> _reviewsForServiceMap = {
  };

  void addReview(int serviceId, String theComment, String imgurl, String personName) {
    // Provider.of(context).addReview
    _currentRatings[serviceId] = 0.0;
    notifyListeners();
  }

   void deleteReview(int serviceId, int reviewIndex) {
      // Provider........... .deleteReview
      notifyListeners();
    
  }


    double getCurrentRating(int serviceId) {
    return _currentRatings[serviceId] ?? 0.0;
  }

  void setCurrentRating(int serviceId, double rating) {
    _currentRatings[serviceId] = rating;
    notifyListeners();
  }
  

  List<OneReview> getReviewsForService(int serviceId) {
    return _reviewsForServiceMap[serviceId]!;
  }
}
