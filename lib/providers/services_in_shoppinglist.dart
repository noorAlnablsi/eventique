import 'package:eventique/models/one_shoppinglist_service.dart';
import 'package:flutter/material.dart';

class ShoppingListsServices with ChangeNotifier {
  Map<String, OneShoppingListService> _shopListservicesWithEventMap = {};

  Map<int, int> _quantities = {};

  int getQuantity(int serviceId) {
    return _quantities[serviceId] ??1;
  }

   void incrementQuantity(int serviceId) {
    _quantities[serviceId] = (_quantities[serviceId] ?? 1) + 1;
    notifyListeners();
  }


  void decrementQuantity(int serviceId) {
    if (_quantities[serviceId] != null && _quantities[serviceId]! > 1) {
      _quantities[serviceId] = _quantities[serviceId]! - 1;
    }
    notifyListeners();
  }
}
