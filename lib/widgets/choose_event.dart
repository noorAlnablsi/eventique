import '/color.dart';
import 'package:eventique/models/one_event.dart';
import 'package:eventique/providers/carts.dart';
import 'package:eventique/providers/events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseEvent extends StatefulWidget {
  const ChooseEvent({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.price,
    required this.serviceId,
  });

  final int serviceId;
  final double price;
  final String imgUrl;
  final String name;

  @override
  State<ChooseEvent> createState() => _ChooseEventState();
}

class _ChooseEventState extends State<ChooseEvent> {
  String? _selectedEventId;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Carts>(context, listen: false);
    final events = Provider.of<Events>(context).planningEvents;

    return SizedBox(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          Text(
            'Choose Event to add to it',
            style: TextStyle(
              color: primary,
              fontFamily: 'IrishGrover',
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.4,
            ),
            child: events.isEmpty
                ? Center(
                    child: Text(
                      'No Events Yet',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontFamily: 'IrishGrover',
                            fontSize: 22,
                            color: const Color.fromARGB(255, 227, 181, 193),
                          ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        leading: // Icon
                            Card(
                          shape: CircleBorder(
                            side: BorderSide(
                              color: primary, // Stroke color
                              width: 1, // Stroke width
                            ),
                          ),
                          elevation: 6,
                          color: beige,
                          // child: Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 8, vertical: 8),
                          //   child: Icon(event.eventType.icon),
                          // ),
                        ),
                        title: Text(
                          event.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        // subtitle: Text(
                        //   '${event.dateTime.toLocal().toString().split(' ')[0]} - ${event.time.format(context)}',
                        //   style: Theme.of(context).textTheme.bodyMedium,
                        // ),
                        tileColor: _selectedEventId == event.eventId
                            ? Colors.grey[300]
                            : null,
                        onTap: () {
                          setState(() {
                            _selectedEventId = event.eventId.toString();
                          });
                          cartProvider
                              .changeChosenEvent(event.eventId.toString());

                          // Add service to cart
                          Provider.of<Carts>(context, listen: false)
                              .addServiceToCart(widget.serviceId, widget.price,
                                  widget.imgUrl, widget.name);

                          //pop the popup
                          Navigator.of(context).pop();

                          // Show snack bar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 76, 27, 75),
                              content: Text(
                                'Added successfully',
                                style: TextStyle(
                                  color: beige,
                                ),
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
