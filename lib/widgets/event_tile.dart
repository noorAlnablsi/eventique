import 'package:eventique/screens/share_event_screen.dart';

import '/color.dart';
import 'package:eventique/models/one_event.dart';
import 'package:eventique/screens/cart.dart';
import 'package:eventique/providers/events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.controller,
    required this.eventType,
    required this.eventBudget,
    required this.eventId,
  });
  final String eventName;
  final double eventBudget;
  final String eventId;
  final DateTime eventDate;
  final int controller;
  final EventType eventType;

  @override
  Widget build(BuildContext context) {
    // Themes
    final TextStyle? bodyMediumStyle = Theme.of(context).textTheme.bodyMedium;

    final eventProvider = Provider.of<Events>(context, listen: false);

    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xff662465), width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.fromLTRB(0, 14, 0, 8),
      color: const Color(0xFFFFFDF0),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        onLongPress: () async {
          // Show a confirmation dialog
          await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                    backgroundColor: const Color(0xFFFFFDF0),
                    title: Text('Delete this event?',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    content: Text(
                        controller == 1
                            ? 'By deleting this event, you will cancel any accepted orders,and the money spent will not be refunded'
                            : 'Remove event form list?',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancel',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w500)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('continue',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w500)),
                        onPressed: () {
                          eventProvider.deleteEvent(eventId);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ));
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment
                .center, // Center aligns the children vertically
            children: [
              // Icon
              Card(
                shape: CircleBorder(
                  side: BorderSide(
                    color: primary, // Stroke color
                    width: 1, // Stroke width
                  ),
                ),
                elevation: 6,
                color: beige,
                margin: const EdgeInsets.only(left: 8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Icon(eventType.icon),
                ),
              ),
              // All texts
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventName,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: bodyMediumStyle!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'IrishGrover'),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${eventDate.toLocal()}'.split(' ')[0],
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis, // Format the date
                        style: bodyMediumStyle.copyWith(
                          color: Color.fromARGB(255, 174, 165, 168),
                          fontFamily: 'IrishGrover',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Cart or Share Event Icon
              Align(
                alignment:
                    Alignment.centerRight, // Aligns the IconButton to the end
                child: IconButton(
                  onPressed: () {
                    controller == 1
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => TestCart(
                                eventBudget: eventBudget,
                                eventId: eventId,
                                eventName: eventName,
                              ),
                            ),
                          )
                        : Navigator.of(context)
                            .pushNamed(ShareEventScreen.routeName);
                  },
                  icon: Icon(
                    controller == 1 ? Icons.trolley : Icons.share,
                    color: secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
