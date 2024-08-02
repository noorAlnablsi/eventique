// //tasneem
// import 'package:eventique/models/one_cartService.dart';
// import 'package:eventique/models/one_order.dart';
// import 'package:eventique/models/service_in_order_details.dart';
// import 'package:flutter/material.dart';

// class Orders with ChangeNotifier {
//   final List<OneOrder> _orders = [];

//   List<OneOrder> get orders {
//     return [..._orders];
//   }

//   List<OneOrder> get processedOrders {
//     return _orders.where((order) => order.isProcessed).toList();
//   }

//   List<OneOrder> get pendingOrders {
//     return _orders.where((order) => !order.isProcessed).toList();
//   }

//   void addOrder(
//       List<OneCartService> orderServices, double orderPrice, String eventName) {
//     // Map each OneCartService to ServiceInOrderDetails to not make a whole new list of ServiceInOrderDetails, so i used the cart list
//     List<ServiceInOrderDetails> serviceInOrderDetails =
//         orderServices.map((cartService) {
//       return ServiceInOrderDetails(
//         orderServiceId: cartService.OneCartServiceId,
//         quantity: cartService.quantity,
//         totalPrice: cartService.totalPrice,
//         imgUrl: cartService.imgUrl,
//         name: cartService.name,
//         status: cartService.OneCartServiceId % 3 == 0
//             ? Status.rejected
//             : cartService.OneCartServiceId % 3 == 1
//                 ? Status.accepted
//                 : Status.pending, //initial status
//       );
//     }).toList();

//     // Create the OneOrder object with the mapped services
//     _orders.insert(
//       0,
//       OneOrder(
//         orderId: DateTime.now().toString(),
//         orderPrice: orderPrice,
//         eventName: eventName,
//         dateTime: DateTime.now(),
//         orderServices: serviceInOrderDetails,
//       ),
//     );

//     notifyListeners();
//   }
// }

// extension OrderStatusExtension on OneOrder {
//   bool get isProcessed {
//     // order processed if all services are accepted or rejected
//     return orderServices.every((service) =>
//         service.status == Status.accepted || service.status == Status.rejected);
//   }
// }

//tasneem
import 'dart:convert';

import 'package:eventique/main.dart';
import 'package:eventique/models/one_cartService.dart';
import 'package:eventique/models/one_order.dart';
import 'package:eventique/models/service_in_order_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Orders with ChangeNotifier {
  final String token;
  final int id;
  Orders(this.token,this.id) {
    fetchprocessedOrders();
    fetchpendingOrders();
  }

  List<OneOrder> _orders = [];
  List<OneOrder> _pendingOrders = [];
  List<OneOrder> _processedOrders = [];

  final OrderService _orderService = OrderService();

  List<OneOrder> get orders => [..._orders];
  List<OneOrder> get processedOrders => [..._pendingOrders];
  List<OneOrder> get pendingOrders => [..._processedOrders];

  Future<void> fetchpendingOrders() async {
    final fetchedorders = await _orderService.fetchpendingOrders(token);
    _pendingOrders = fetchedorders;
  }

  Future<void> fetchprocessedOrders() async {
    final fetchedorders = await _orderService.fetchprocessedOrders(token);
    _processedOrders = fetchedorders;
  }

//taghreed wrote this
  Future<void> addOrder(
      int eventId, List<OneCartService> orderdServicesFromCart) async {
    final url = Uri.parse('$host/api/insert_order');
    print(url);
    try {
      final List<Map<String, dynamic>> orderDetails =
          orderdServicesFromCart.map((service) {
        return {
          'OneCartServiceId': service.OneCartServiceId,
          'quantity': service.quantity,
        };
      }).toList();
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'locale': 'en',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'user_id':id,
          'event_id': eventId,
          'services': orderDetails,
        }),
      );
      final responseData = json.decode(response.body);
      print(responseData);

      if (responseData == null) {
        throw Exception();
      }
      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

//   void addOrder(List<OneCartService> orderdServicesFromCart, double orderPrice, String eventName) {
//     // Map each OneCartService to ServiceInOrderDetails to not make a whole new list of ServiceInOrderDetails, so i used the cart list
//     // List<ServiceInOrderDetails> serviceInOrderDetails =
//     //     orderServices.map((cartService) {
//     //   return ServiceInOrderDetails(
//     //     orderServiceId: cartService.OneCartServiceId,
//     //     quantity: cartService.quantity,
//     //     totalPrice: cartService.totalPrice,
//     //     imgUrl: cartService.imgUrl,
//     //     name: cartService.name,
//     //     status: cartService.OneCartServiceId % 3 == 0
//     //         ? Status.rejected
//     //         : cartService.OneCartServiceId % 3 == 1
//     //             ? Status.accepted
//     //             : Status.pending, //initial status
//     //   );
//     // }).toList();

//     // // Create the OneOrder object with the mapped services
//     // _orders.insert(
//     //   0,
//     //   OneOrder(
//     //     orderId: DateTime.now().toString(),
//     //     orderPrice: orderPrice,
//     //     eventName: eventName,
//     //     dateTime: DateTime.now(),
//     //     orderServices: serviceInOrderDetails,
//     //   ),
//     // );

//     // notifyListeners();
//   }
}

class OrderService {
  final String apiUrl = '$host/api/';
  final String apiUrl1 = '$host/api/';
  final String apiUrl2 = '$host/api/';

  void addOrder(String token) async {
    print('I am in addOrderrrrrrrrr and going to get them');

    final response = await http.post(Uri.parse(apiUrl), headers: {
      'Accept': 'application/json',
      'locale': 'ar',
      'Authorization': 'Bearer $token',
    }, body: {});
    if (response.statusCode == 200) {
      print('I am in the addOrderrrrrrrrr 200');
    } else {
      print(response.body);
      throw Exception('Failed addOrderrrrrrrrr');
    }
  }

  Future<List<OneOrder>> fetchpendingOrders(String token) async {
    print('I am in fetchpendingOrdersssssssss ');

    final response = await http.get(
      Uri.parse(apiUrl1),
      headers: {
        'Accept': 'application/json',
        'locale': 'ar',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print('Successfully fetched ');
      final data = jsonDecode(response.body);
      final orders = data['data'] as List;

      return orders.map((e) {
        final date = DateTime.parse(e['date']);

        return OneOrder(
          orderId: e['id'],
          eventName: e['iddddddddddddddddddddddddd'],
          orderPrice: e['iddddddddddddddddddddddddd'],
          orderPaidPrice: e['iddddddddddddddddddddddddd'],
          dateTime: date,
          orderServices: [],
        );
      }).toList();
    } else {
      print(response.body);
      throw Exception('Faileddddddddd');
    }
  }

  Future<List<OneOrder>> fetchprocessedOrders(String token) async {
    print('I am in fetchprocessedOrdersssssssss ');

    final response = await http.get(
      Uri.parse(apiUrl1),
      headers: {
        'Accept': 'application/json',
        'locale': 'ar',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print('Successfully fetched ');
      final data = jsonDecode(response.body);
      final orders = data['data'] as List;

      return orders.map((e) {
        final date = DateTime.parse(e['date']);

        return OneOrder(
          orderId: e['id'],
          eventName: e['iddddddddddddddddddddddddd'],
          orderPrice: e['iddddddddddddddddddddddddd'],
          orderPaidPrice: e['iddddddddddddddddddddddddd'],
          dateTime: date,
          orderServices: [],
        );
      }).toList();
    } else {
      print(response.body);
      throw Exception('Faileddddddddd');
    }
  }
}
