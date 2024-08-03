// //tasneem
// import 'package:eventique/models/one_review.dart';
// import 'package:flutter/material.dart';

// class Reviews with ChangeNotifier {
//   Map<int, double> _currentRatings = {};

//   final Map<int, List<OneReview>> _reviewsForServiceMap = {
//     1: [
//       OneReview(
//         theComment:
//             'the cream cheese frosting was the perfect balance of sweet and tangy',
//         rating: 3,
//         personName: 'Mira Hasan',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//       OneReview(
//         theComment:
//             'those handcrafted truffles were divine. It was the perfect ending to a perfect dinner',
//         rating: 4,
//         personName: 'Tasneem Masri',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//       OneReview(
//         theComment:
//             'the cream cheese frosting was the perfect balance of sweet and tangy',
//         rating: 2.5,
//         personName: 'Batoul haffar',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//       OneReview(
//         theComment:
//             'The Velvet Symphony cake was a showstopper at our anniversary party! The red velvet layers were so moist, and the cream cheese frosting was the perfect balance of sweet and tangy',
//         rating: 4,
//         personName: 'Raneem Masri',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//     ],
//     2: [
//       OneReview(
//         theComment: 'Truly the best roses Ive ever received',
//         rating: 4,
//         personName: 'Batoul haffar',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//       OneReview(
//         theComment:
//             'those handcrafted truffles were divine. It was the perfect ending to a perfect dinner',
//         rating: 4.5,
//         personName: 'Mira Hasan',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//     ],
//     3: [
//       OneReview(
//         theComment:
//             ' the veranda offered breathtaking views. Our guests havent stopped talking about it. Thank you for making our special day truly unforgettable',
//         rating: 2.5,
//         personName: 'Tasneem Masri',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//       OneReview(
//         theComment:
//             ' it was the epitome of elegance. The ambiance, the service, the attention to detail',
//         rating: 4,
//         personName: 'Mira Hasan',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//     ],
//     4: [],
//     5: [
//       OneReview(
//         theComment:
//             'The Velvet Symphony cake was a showstopper at our anniversary party! The red velvet layers were so moist, and the cream cheese frosting was the perfect balance of sweet and tangy',
//         rating: 4,
//         personName: 'Tasneem Masri',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//       OneReview(
//         theComment:
//             'those handcrafted truffles were divine. It was the perfect ending to a perfect dinner',
//         rating: 5,
//         personName: 'Mira Hasan',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//       OneReview(
//         theComment:
//             'the cream cheese frosting was the perfect balance of sweet and tangy',
//         rating: 1.5,
//         personName: 'Batoul haffar',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//       OneReview(
//         theComment:
//             'The Velvet Symphony cake was a showstopper at our anniversary party! The red velvet layers were so moist, and the cream cheese frosting was the perfect balance of sweet and tangy',
//         rating: 4,
//         personName: 'Raneem Masri',
//         imgurl:
//             'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       ),
//     ]
//   };

//   void addReview(
//       int serviceId, String theComment, String imgurl, String personName) {
//     if (_reviewsForServiceMap.containsKey(serviceId)) {
//       _reviewsForServiceMap[serviceId]!.add(OneReview(
//           theComment: theComment,
//           personName: personName,
//           imgurl: imgurl,
//           rating: _currentRatings[serviceId] ?? 0.0));
//     } else {
//       _reviewsForServiceMap[serviceId] = [
//         OneReview(
//             theComment: theComment,
//             personName: personName,
//             imgurl: imgurl,
//             rating: _currentRatings[serviceId] ?? 0.0)
//       ];
//     }
//     _currentRatings[serviceId] = 0.0;
//     notifyListeners();
//   }

//   void deleteReview(int serviceId, int reviewIndex) {
//     if (_reviewsForServiceMap.containsKey(serviceId) &&
//         reviewIndex >= 0 &&
//         reviewIndex < _reviewsForServiceMap[serviceId]!.length) {
//       _reviewsForServiceMap[serviceId]!.removeAt(reviewIndex);
//       notifyListeners();
//     }
//   }

//   double getCurrentRating(int serviceId) {
//     return _currentRatings[serviceId] ?? 0.0;
//   }

//   void setCurrentRating(int serviceId, double rating) {
//     _currentRatings[serviceId] = rating;
//     notifyListeners();
//   }

//   List<OneReview> getReviewsForService(int serviceId) {
//     return _reviewsForServiceMap[serviceId]!;
//   }
// }


//tasneem
import 'dart:convert';
import 'dart:ffi';

import 'package:eventique/main.dart';
import 'package:eventique/models/one_review.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Reviews with ChangeNotifier {
  final String token;
  Reviews(this.token);
  Map<int, double> _currentRatings = {};
  ReviewsService reviewsService=ReviewsService();

  final Map<int, List<OneReview>> _reviewsForServiceMap = {};

  void addReview(int serviceId, String theComment, String imgurl, String personName) {
    reviewsService.addReview(token,  _currentRatings[serviceId] ?? 0.0, theComment, serviceId);
  
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
    reviewsService.deleteReview(serviceId,token);
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


class ReviewsService{
final String apiUrl = '$host/api/reviews';

  void addReview(String token,double rate,String description,int serviceId)async{  
    print('iam in addReviewwwwwwwww')  ;
    final response = await http.post(
      Uri.parse(apiUrl),
       headers: {
      'Accept': 'application/json',
      'locale': 'ar',
      'Authorization': 'Bearer $token',
    },
     body: {
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

  Future<List<OneReview>> fetchReviews(String token,int serviceId) async {
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
          personName:e['name'] ,
          theComment:e['description']??'' ,
          rating: (e['rate'] as num).toDouble(),  // Convert rate to double
          imgurl: e['images'].isNotEmpty ? e['images'][0] : '',
          personId:e['user_id'] ,
        );
      }).toList();
    } else {
      print(response.body);
      throw Exception('Failed fetchReviewsssssssssss');
    }
  }

}