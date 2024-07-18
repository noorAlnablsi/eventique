import 'package:eventique/models/one_service.dart';
import 'package:flutter/material.dart';

class Saved with ChangeNotifier {
  final List<OneService> _savedServices = [];

  List<OneService> get savedServices {
    return [..._savedServices];
  }

  void add(OneService service) {
    if(!_savedServices.contains(service)) {
      _savedServices.add(service);
         notifyListeners();
    }
    
    
  }

  void delete(int serviceId) {
    _savedServices.removeWhere((element) => element.serviceId==serviceId);
    notifyListeners();
  }
}
