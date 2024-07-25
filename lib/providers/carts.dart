//tasneem
import 'package:eventique/models/one_cartService.dart';
import 'package:flutter/material.dart';

class Carts with ChangeNotifier {
  //map each event id with its cart,each cart has cart servicess with the original service thats why i used another map to link them
  final Map<String, Map<int, OneCartService>> _carts = {};

// gets all the carts for all events"not needed !"
  Map<String, Map<int, OneCartService>> get carts => _carts;

// gets an event cart(one cart only),if not found it returns empty map
  Map<int, OneCartService> getCart(String eventId) {
    return _carts[eventId] ?? {};
  }

  //i have quantity for each service thats why i am using a map
  final Map<int, int> _quantities = {};

  //get specific service quantity
  int getQuantity(int serviceId) {
    return _quantities[serviceId] ?? 1;
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

  String chosenEventId = '';
  void changeChosenEvent(String eventId) {
    chosenEventId = eventId;
    notifyListeners();
  }

  void addServiceToCart(
      int serviceId, double servicePrice, String imgUrl, String name) {
    if (chosenEventId.isEmpty) {
      throw Exception('No event chosen');
    }

    if (!_carts.containsKey(chosenEventId)) {
      _carts[chosenEventId] = {};
    }

    final eventCart = _carts[chosenEventId]!;

    if (eventCart.containsKey(serviceId)) {
      final existingService = eventCart[serviceId]!;
      final newQuantity = existingService.quantity + getQuantity(serviceId);
      final newTotalPrice = newQuantity * servicePrice;
      eventCart[serviceId] = OneCartService(
        OneCartServiceId: serviceId,
        quantity: newQuantity,
        totalPrice: newTotalPrice,
        imgUrl: imgUrl,
        name: name,
      );
    } else {
      eventCart[serviceId] = OneCartService(
        OneCartServiceId: serviceId,
        quantity: getQuantity(serviceId),
        totalPrice: getQuantity(serviceId) * servicePrice,
        imgUrl: imgUrl,
        name: name,
      );
    }
    _quantities[serviceId] = 1;
    chosenEventId = '';

    notifyListeners();
  }

  removeServiceFromCart(String eventId, int serviceId) {
    if (_carts.containsKey(eventId)) {
      final eventCart = _carts[eventId]!;
      eventCart.remove(serviceId);
      if (eventCart.isEmpty) {
        _carts.remove(eventId);
      }
      notifyListeners();
    }
  }

  //when ordering ,the cart should become empty
  void clearCart(String eventId) {
    if (_carts.containsKey(eventId)) {
      _carts[eventId]!.clear();
      _carts.remove(eventId);
      notifyListeners();
    }
  }

  double getOrderTotalPrice(String eventId) {
    double total = 0.0;
    if (_carts.containsKey(eventId)) {
      _carts[eventId]!.forEach((key, cartService) {
        total += cartService.totalPrice;
      });
    }
    return total;
  }
}
