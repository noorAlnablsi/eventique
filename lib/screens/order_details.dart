//tasneem
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventique/models/service_in_order_details.dart';
import 'package:eventique/providers/orders.dart';
import 'package:eventique/widgets/service_in_orderdetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({
    super.key,
    required this.id,
    required this.eventName,
  });
  final String id;
  final String eventName;
  // final List<ServiceInOrderDetails> services;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool _isLoading = false;
  bool _isInit = true;
  Future<void> fetchOrderDetails() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Orders>(context, listen: false)
          .fetchOrderDetails(widget.id);
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print(error);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      fetchOrderDetails();
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context).oneOrder;
    final List<ServiceInOrderDetails>? services = order.orderServices;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Details",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontFamily: 'IrishGrover'),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            height: 4.0,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.eventName,
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontFamily: 'IrishGrover', fontSize: 18),
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services!.length,
                itemBuilder: (ctx, i) => ServiceInOrderDetailsTile(
                  service: services[i],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
