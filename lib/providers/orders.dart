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
  Orders(this.token, this.id) {
    fetchPendingOrders();
    fetchProcessedOrders();
    // fetchprocessedOrders();
    // fetchpendingOrders();
  }

  List<OneOrder> _orders = [];
  List<OneOrder> _pendingOrders = [];
  List<OneOrder> _processedOrders = [];

  final OrderService _orderService = OrderService();

  List<OneOrder> get orders => [..._orders];
  List<OneOrder> get processedOrders => [..._pendingOrders];
  List<OneOrder> get pendingOrders => [..._processedOrders];

  // Future<void> fetchpendingOrders() async {
  //   final fetchedorders = await _orderService.fetchpendingOrders(token);
  //   _pendingOrders = fetchedorders;
  // }

  // Future<void> fetchprocessedOrders() async {
  //   final fetchedorders = await _orderService.fetchprocessedOrders(token);
  //   _processedOrders = fetchedorders;
  // }

//taghreed wrote this
  Future<void> addOrder(
      int eventId, List<OneCartService> orderdServicesFromCart) async {
    final url = Uri.parse('$host/api/insert_order');
    print(url);
    try {
      final List<Map<String, dynamic>> orderDetails =
          orderdServicesFromCart.map((service) {
        return {
          'id': service.OneCartServiceId,
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
          'user_id': id,
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

//taghreed
  Future<void> fetchProcessedOrders() async {
    final url = Uri.parse('$host/api/processed_orders/4');
    print(url);
    try {
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'locale': 'en',
        },
      );
      final data = json.decode(response.body);

      // Check if 'processed_order' key exists and is not null
      if (data.containsKey('pending_order') && data['pending_order'] != null) {
        final responseData = data['pending_order'] as List<dynamic>;
        print(responseData);
        List<OneOrder> temp = [];
        for (var order in responseData) {
          temp.add(OneOrder(
            orderId: order['id'].toString(),
            orderPrice: (order['total_price'] as num).toDouble(),
            orderPaidPrice: 0.00,
            dateTime: DateTime.parse(order['order_date']),
            eventName: order['event_name'],
            orderServices: [],
          ));
        }
        print('this is temp Processed order:$temp');

        _processedOrders = temp;
        print('this is processed orders will be showed:$_processedOrders');
        // notifyListeners(); // Make sure you call this if you're using a state management solution
      } else {
        print('Processed orders key missing or null');
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchPendingOrders() async {
    final url = Uri.parse('$host/api/pending_orders/4');
    print(url);
    try {
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'locale': 'en',
        },
      );
      final data = json.decode(response.body);
      final responseData = data['pending_order'] as List<dynamic>;
      print(responseData);
      List<OneOrder> temp = [];
      for (var order in responseData) {
        temp.add(OneOrder(
          orderId: order['id'].toString(),
          orderPrice: (order['total_price'] as num).toDouble(),
          orderPaidPrice: 0.00,
          dateTime: DateTime.parse(order['order_date']),
          eventName: order['event_name'],
          orderServices: [],
        ));
      }
      print('this is temp in pending order:$temp');

      _pendingOrders = temp;
      print('this is pending orders will be showed:$_pendingOrders');
      // notifyListeners(); // Make sure you call this if you're using a state management solution
    } catch (error) {
      print(error);
      throw error;
    }
  }
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
