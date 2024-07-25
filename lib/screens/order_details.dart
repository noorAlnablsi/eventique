//tasneem
import 'package:eventique/models/service_in_order_details.dart';
import 'package:eventique/widgets/service_in_orderdetails.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails(
      {super.key, required this.eventName, required this.services});
  final String eventName;
  final List<ServiceInOrderDetails> services;

  @override
  Widget build(BuildContext context) {
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
                eventName,
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
                itemCount: services.length,
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
