import 'package:eventique/models/service_in_order_details.dart';

class OneOrder {
  final String orderId;
  final double orderPrice;
  final List<ServiceInOrderDetails> orderServices;
  final DateTime dateTime;
  final String eventName;
  OneOrder({
    required this.orderServices,
    required this.orderId,
    required this.orderPrice,
    required this.dateTime,
    required this.eventName,
  });
}
