import 'dart:convert';
import 'package:eventique/models/vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/main.dart';

class VendorsProvider with ChangeNotifier {
  List<Vendor> vendors = [
    Vendor(
      id: '0',
      name: 'Bee Cake',
      email: 'beeCake8@gmail.com',
      phone: '0957515617',
      location: 'location',
      description:
          'description heyyyyyyyyy slfjhd ioewhn lhfoihoi llshio sjlie jlsj',
      days: 'days',
      time: 'time',
      imageUrl: '',
      coverImageUrl: '',
    ),
    Vendor(
      id: '1',
      name: 'dream Cake',
      email: 'dreamCake8@gmail.com',
      phone: '0957515618',
      location: 'location',
      description: 'description',
      days: 'days',
      time: 'time',
      imageUrl: '',
      coverImageUrl: '',
    ),
    Vendor(
      id: '2',
      name: 'Al Qassaa Flowers',
      email: 'qassaflowerCake8@gmail.com',
      phone: '0957515619',
      location: 'location',
      description: 'description',
      days: 'days',
      time: 'time',
      imageUrl: '',
      coverImageUrl: '',
    )
  ];

  List<Vendor> get vendorsList {
    return [...vendors];
  }

  Vendor findById(String id) {
    return vendors.firstWhere((vendor) => vendor.id == id);
  }
}
