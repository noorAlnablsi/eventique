import 'package:eventique/models/one_cartService.dart';
import 'package:eventique/models/one_order.dart';
import 'package:eventique/models/service_in_order_details.dart';
import 'package:flutter/material.dart';

class Orders with ChangeNotifier {
  final List<OneOrder> _orders = [];

  List<OneOrder> get orders {
    return [..._orders];
  }

  List<OneOrder> get processedOrders {
    return _orders.where((order) => order.isProcessed).toList();
  }

  List<OneOrder> get pendingOrders {
    return _orders.where((order) => !
    order.isProcessed).toList();
  }

  void addOrder(List<OneCartService> orderServices, double orderPrice, String eventName) {
    // Map each OneCartService to ServiceInOrderDetails to not make a whole new list of ServiceInOrderDetails, so i used the cart list
    List<ServiceInOrderDetails> serviceInOrderDetails =
        orderServices.map((cartService) {
      return ServiceInOrderDetails(
        orderServiceId: cartService.OneCartServiceId,
        quantity: cartService.quantity,
        totalPrice: cartService.totalPrice,
        imgUrl: cartService.imgUrl,
        name: cartService.name,
        status: cartService.OneCartServiceId%3==0? Status.rejected: cartService.OneCartServiceId%3==1 ?Status.accepted:Status.pending, //initial status
      );
    }).toList();

    // Create the OneOrder object with the mapped services
    _orders.insert(
      0,
      OneOrder(
        orderId: DateTime.now().toString(),
        orderPrice: orderPrice,
        eventName: eventName,
        dateTime: DateTime.now(),
        orderServices: serviceInOrderDetails,
      ),
    );

    notifyListeners();
  }
}

extension OrderStatusExtension on OneOrder {
  bool get isProcessed {
    // order processed if all services are accepted or rejected
    return orderServices.every((service) =>
        service.status == Status.accepted || service.status == Status.rejected);
  }
}

