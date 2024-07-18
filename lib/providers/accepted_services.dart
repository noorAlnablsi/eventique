import 'package:eventique/models/service_in_order_details.dart';
import 'package:flutter/material.dart';

class AcceptedServicesPro with ChangeNotifier{
final List<ServiceInOrderDetails> services=[
   ServiceInOrderDetails(
    imgUrl: 'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    name:'red velvet' ,
    orderServiceId: 2,
    quantity:4 ,
    status: Status.accepted,
    totalPrice: 53,
  ),
   ServiceInOrderDetails(
    imgUrl:  'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg',
    name: 'Dream Cake',
    orderServiceId:3 ,
    quantity: 1,
    status: Status.accepted,
    totalPrice: 43,
  ),
   ServiceInOrderDetails(
    imgUrl: 'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
    name: 'salad',
    orderServiceId:4 ,
    quantity: 3,
    status: Status.accepted,
    totalPrice:24 ,
  )
]; 

double getTotalPriceOfAcceptedServices() {
    double total = 0.0;
    for (var service in services) {
      if (service.status == Status.accepted) {
        total += service.totalPrice;
      }
    }
    return total;
  }
  
}