import 'dart:convert';

import 'package:eventique/core/resources/color.dart';
import 'package:eventique/models/one_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Saved with ChangeNotifier {
  Saved(){
    fetchSaved();
}
   List<OneService> _savedServices = [];
  final SavedService _service=SavedService();


  List<OneService> get savedServices =>[..._savedServices];

  Future<void> fetchSaved() async {
    final fetchedServices = await _service.fetchSaved(token);
    _savedServices = fetchedServices;
    notifyListeners();
  }

  void add(int serviceId) {
    // _service.addSaved(serviceId, token);
    }
    
  void delete(int serviceId) {
    // _service.deleteSaved(serviceId,token);
  }
}




class SavedService {
  final String apiUrl ='http://192.168.1.102:8000/api/favorites';


  // void addSaved(int serviceId, String token) async {
  //   print('I am in addSavedddddddddddddd ');

  //   final response = await http.post(Uri.parse(apiUrl), 
  //   headers: {
  //     'Accept': 'application/json',
  //     'locale': 'ar',
  //     'Authorization': 'Bearer $token',
  //   }, body: {
  //     'service_id': serviceId.toString(),
  //   });
  //   if (response.statusCode == 200) {
  //     print('I am in the addSavedddddddddddddd 200');
  //   } else {
  //     print(response.body);
  //     throw Exception('Failed addSavedddddddddddddd');
  //   }
  // }

  // void deleteSaved(int serviceId, String token) async {
  //   final String apiUrl ='http://192.168.1.102:8000/api/favorites/$serviceId';
  //   print('I am in deleteSaveddddddddd ');

  //   final response = await http.delete(
  //     Uri.parse(apiUrl),
  //     headers: {
  //       'Accept': 'application/json',
  //       'locale': 'en',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     print('I am in the deleteSaveddddddddddddd 200');
  //   } else {
  //     print(response.body);
  //     throw Exception('Failed deleteSaveddddddddddddd');
  //   }
  // }

  Future<List<OneService>> fetchSaved(String token) async {
    print('I am in fetchSavedddddddddddddd and going to get them');

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Accept': 'application/json',
        'locale': 'en', 
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print('iam in fetchSavedddddddddddddddddddddd 200');
      final data = jsonDecode(response.body);
      final allServices = data['services'] as List;

      return allServices.map((e) {
        List<String> imageUrls = [];
        if (e['images'] != null) {
          imageUrls = (e['images'] as List)
              .map((img) => img['url'].toString())
              .toList();
        }

        return OneService(
          serviceId: e['id'],
          categoryId: e['category_id'],
          description: e['description'],
          imgsUrl: imageUrls,
          name: e['name'],
          price: double.parse(e['price'].toString()),  // Ensure price is parsed as double
          rating: e['average_rating'] != null ? double.parse(e['average_rating'].toString()) : null,  // Ensure rating is parsed as double
          vendorName: e['company_name'],
        );
      }).toList();
    } else {
      print(response.body);
      throw Exception('Failed to load fetchSaved');
    }
  }


}
