//tasneem
import 'dart:convert';

import 'package:eventique/main.dart';
import 'package:eventique/models/one_cartService.dart';
import 'package:eventique/models/one_order.dart';
import 'package:eventique/models/one_service.dart';
import 'package:eventique/models/service_in_order_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Orders with ChangeNotifier {
  final String token;
  final int id;
  Orders(this.token, this.id) {
    fetchPendingOrders();
    fetchProcessedOrders();
  }

  List<OneOrder> _orders = [];
  List<OneOrder> _pendingOrders = [];
  List<OneOrder> _processedOrders = [];
  OneOrder _oneOrder = OneOrder();

  List<OneOrder> get orders => [..._orders];
  List<OneOrder> get processedOrders => [..._pendingOrders];
  List<OneOrder> get pendingOrders => [..._processedOrders];
  OneOrder get oneOrder => _oneOrder;

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
    final url = Uri.parse('$host/api/processed_orders/$id');
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
    final url = Uri.parse('$host/api/pending_orders/$id');
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

  Future<void> fetchOrderDetails(String id) async {
    final url = Uri.parse('$host/api/order_details');
    print(url);
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'locale': 'en',
        },
        body: {
          'order_id': id,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);

        // Parsing services
        List<ServiceInOrderDetails> services = [];
        if (responseData['services'] != null) {
          services = (responseData['services'] as List).map((service) {
            String imgUrl = (service['images'] as List).isNotEmpty
                ? service['images'][0]['url']
                : '';

            return ServiceInOrderDetails(
              orderServiceId: service['id'],
              quantity: service['quantity'],
              totalPrice: service['priceinpivot'].toDouble(),
              imgUrl: imgUrl,
              status: service['status'],
              name: service['name'],
            );
          }).toList();
        }

        // Parsing order details
        OneOrder orderDetails = OneOrder(
          orderServices: services,
          orderId: responseData['order_id'],
          orderPrice: responseData['order_price'] != null
              ? responseData['order_price'].toDouble()
              : null,
          orderPaidPrice: responseData['order_paid_price'] != null
              ? responseData['order_paid_price'].toDouble()
              : null,
          dateTime: responseData['date_time'] != null
              ? DateTime.parse(responseData['date_time'])
              : null,
          eventName: responseData['event_name'],
        );

        // Do something with the orderDetails, like updating the state or notifying listeners
        _oneOrder = orderDetails;
        print(_oneOrder);

        notifyListeners(); // Notify listeners about the update
      } else {
        print('Failed to load order details');
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
