import 'package:eventique/models/service_in_order_details.dart';
import 'package:flutter/material.dart';

class AcceptedServicesPro with ChangeNotifier {
  final List<ServiceInOrderDetails> services = [];

  double getTotalPriceOfAcceptedServices() {
    double total = 0.0;
    return total;
  }
}
