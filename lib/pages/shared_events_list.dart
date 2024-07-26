import 'package:eventique/core/resources/color.dart';
import 'package:flutter/material.dart';

class SharedEvents extends StatelessWidget {
   SharedEvents({super.key});
  final events=[1];

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: Text(
          'My Shared Events',
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
      body: events.isEmpty
        ? Center(
            child: Text(
              'You did\'nt share any event yet',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontFamily: 'IrishGrover',
                    fontSize: 22,
                    color: const Color.fromARGB(255, 227, 181, 193),
                  ),
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: events.length,
            itemBuilder: (ctx, i) {
              return SharedEventTile(
                // eventDate: events[i].dateTime,
                // eventName: events[i].name,
                // eventType: events[i].eventType,
                // eventBudget: events[i].budget,
                // eventId: events[i].eventId,
                // guests:  events[i].guestsNumber,
                // eventTime:  events[i].time,
              );
            },
          ),
    );
  }
}

class SharedEventTile extends StatelessWidget {
  const SharedEventTile({super.key});

  @override
  Widget build(BuildContext context) {
        final TextStyle? bodyMediumStyle = Theme.of(context).textTheme.bodyMedium;

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
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (ctx) => you and us screen
          //   ),
          // );
        },
        onLongPress: () async {
          await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: const Color(0xFFFFFDF0),
              title: Text(
                'Delete this event ?',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // content: Text(
              //   'Remove event from list?',
              //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              //       fontSize: 14, fontWeight: FontWeight.bold),
              // ),
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
                  child: Text('Continue',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500)),
                  onPressed: () {
                    //delete event
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                shape: CircleBorder(
                  side: BorderSide(
                    color: primary,
                    width: 1,
                  ),
                ),
                elevation: 6,
                color: beige,
                margin: const EdgeInsets.only(left: 8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: 
                  // Icon(eventType.icon),
                  Icon(Icons.abc),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'eventName',
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: bodyMediumStyle!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'IrishGrover',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'eventDate',
                        // '${eventDate.toLocal()}'.split(' ')[0],
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: bodyMediumStyle.copyWith(
                          color: const Color.fromARGB(255, 174, 165, 168),
                          fontFamily: 'IrishGrover',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
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