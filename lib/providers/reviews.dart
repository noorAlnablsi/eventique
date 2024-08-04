//tasneem
import 'dart:convert';

import 'package:eventique/main.dart';
import 'package:eventique/models/one_review.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Reviews with ChangeNotifier {
  final String token;
  Reviews(this.token);
  Map<int, double> _currentRatings = {};
  ReviewsService reviewsService = ReviewsService();

  final Map<int, List<OneReview>> _reviewsForServiceMap = {};

  void addReview(
      int serviceId, String theComment, String imgurl, String personName) {
    reviewsService.addReview(
        token, _currentRatings[serviceId] ?? 0.0, theComment, serviceId);

    // OneReview(
    //         theComment: theComment,
    //         personName: personName,
    //         imgurl: imgurl,
    //         rating: _currentRatings[serviceId] ?? 0.0);

    _currentRatings[serviceId] = 0.0;
    getReviewsForService(serviceId);
    notifyListeners();
  }

  void deleteReview(int serviceId, int reviewIndex) {
    reviewsService.deleteReview(serviceId, token);
    getReviewsForService(serviceId);
    notifyListeners();
  }

  double getCurrentRating(int serviceId) {
    return _currentRatings[serviceId] ?? 0.0;
  }

  void setCurrentRating(int serviceId, double rating) {
    _currentRatings[serviceId] = rating;
    notifyListeners();
  }

  Future<void> getReviewsForService(int serviceId) async {
    final reviews = await reviewsService.fetchReviews(token, serviceId);
    _reviewsForServiceMap[serviceId] = reviews;
    notifyListeners();
  }

  List<OneReview> reviewsForService(int serviceId) {
    return _reviewsForServiceMap[serviceId] ?? [];
  }
}

class ReviewsService {
  final String apiUrl = '$host/api/reviews';

  void addReview(
      String token, double rate, String description, int serviceId) async {
    print('iam in addReviewwwwwwwww');
    final response = await http.post(Uri.parse(apiUrl), headers: {
      'Accept': 'application/json',
      'locale': 'ar',
      'Authorization': 'Bearer $token',
    }, body: {
      "rate": rate.toString(),
      "description": description,
      "service_id": serviceId.toString(),
    });
    if (response.statusCode == 200) {
      print('I am in the addReviewwwwwwwww 200');
    } else {
      print(response.body);
      throw Exception('Failed addReviewwwwwwwww');
    }
  }

  void deleteReview(int reviewId, String token) async {
    print('I am in deleteReviewwwwwwwwwwwww ');
    final String apiUrl = '$host/api/reviews/$reviewId';

    final response = await http.delete(
      Uri.parse(apiUrl),
      headers: {
        'Accept': 'application/json',
        'locale': 'ar',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print('I am in the deleteReviewwwwwwww 200');
    } else {
      print(response.body);
      throw Exception('Failed deleteReviewwwwwwwwwww');
    }
  }

  Future<List<OneReview>> fetchReviews(String token, int serviceId) async {
    print('I am in fetchReviewsssssssssss ');
    final String apiUrl = '$host/api/reviews/$serviceId';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Accept': 'application/json',
        'locale': 'ar',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print('Successfully fetchReviewsssssssssss');
      final data = jsonDecode(response.body);
      final events = data['users'] as List;

      return events.map((e) {
        return OneReview(
          personName: e['name'],
          theComment: e['description'] ?? '',
          rating: (e['rate'] as num).toDouble(), // Convert rate to double
          imgurl: e['images'].isNotEmpty ? e['images'][0] : '',
          personId: e['user_id'],
        );
      }).toList();
    } else {
      print(response.body);
      throw Exception('Failed fetchReviewsssssssssss');
    }
  }
}
