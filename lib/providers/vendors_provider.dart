import 'dart:convert';
import 'package:eventique/models/vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/main.dart';

class VendorsProvider with ChangeNotifier {
  List<Vendor> vendors = [
    Vendor(
        id: '0',
        name: 'name',
        email: 'email',
        phone: 'phone',
        location: 'location',
        description: 'description',
        days: 'days',
        time: 'time')
  ];

  List<Vendor> get vendorsList {
    return [...vendors];
  }

  Vendor findById(String id) {
    return vendors.firstWhere((vendor) => vendor.id == id);
  }
}
