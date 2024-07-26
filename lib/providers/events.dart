// import 'package:eventique/models/one_event.dart';
// import 'package:flutter/material.dart';

// enum EventType { birthday, wedding, engagement, holiday }

// extension EventTypeExtension on EventType {
//   IconData get icon {
//     switch (this) {
//       case EventType.birthday:
//         return Icons.cake;
//       case EventType.wedding:
//         return Icons.celebration;
//       case EventType.engagement:
//         return Icons.ring_volume;
//       case EventType.holiday:
//         return Icons.beach_access;
//       default:
//         return Icons.event;
//     }
//   }
// }

// class Events with ChangeNotifier {
//   final List<OneEvent> _events = [
//     OneEvent(eventId: 'id1', name: 'Roro\'s Wedding', budget: 100, guestsNumber: 30, time: TimeOfDay(hour: 12, minute: 30), dateTime: DateTime(2023), eventType: EventType.wedding),
//     OneEvent(eventId: 'id2', name: 'lolo\'s birthday', budget: 100, guestsNumber: 30, time: TimeOfDay(hour: 12, minute: 30), dateTime: DateTime(2026), eventType: EventType.wedding),
//     OneEvent(eventId: 'id3', name: 'My birthday', budget: 100, guestsNumber: 30, time: TimeOfDay(hour: 12, minute: 30), dateTime: DateTime(2025), eventType: EventType.birthday),
//     OneEvent(eventId: 'idhihi', name: 'Eid', budget: 100, guestsNumber: 30, time: TimeOfDay(hour: 12, minute: 30), dateTime: DateTime(2023), eventType: EventType.holiday)
//   ];

//   List<OneEvent> get events {
//     return [..._events];
//   }

//   List<OneEvent> get planningEvents {
//     return _events.where((event) => event.dateTime.isAfter(DateTime.now())).toList();
//   }

//   List<OneEvent> get completedEvents {
//     return _events.where((event) => event.dateTime.isBefore(DateTime.now())).toList();
//   }

//   void addEvent(OneEvent event) {
//     _events.insert(0, event);
//     notifyListeners();
//   }

//   void deleteEvent(String eventId) {
//     _events.removeWhere((event) => event.eventId == eventId);
//     notifyListeners();
//   }

//  void editEvent(String eventId, {String? name, double? budget, int? guestsNumber, TimeOfDay? time, DateTime? dateTime, EventType? eventType}) {
//     final event = _events.firstWhere((event) => event.eventId == eventId);
//     final updatedEvent = OneEvent(
//       eventId: event.eventId,
//       name: name ?? event.name,
//       budget: budget ?? event.budget,
//       guestsNumber: guestsNumber ?? event.guestsNumber,
//       time: time ?? event.time,
//       dateTime: dateTime ?? event.dateTime,
//       eventType: eventType ?? event.eventType,
//     );
//     final eventIndex = _events.indexOf(event);
//     _events[eventIndex] = updatedEvent;
//     notifyListeners();
//   }

//   OneEvent findEventById(String eventId) {
//   return _events.firstWhere((event) => event.eventId == eventId);
// }

// }
import 'dart:convert';
import 'package:eventique/models/one_event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Events with ChangeNotifier {
  Events() {
    _fetchEventTypes();
    fetchPlanningEvents();
    fetchCompletedEvents();
  }
  List<EventType> _eventTypes = [];
  List<OneEvent> _completedEvents = [];
    List<OneEvent> _planningEvents = [];


  List<EventType> get eventTypes => _eventTypes;

  List<OneEvent> get completedEvents => [..._completedEvents];
  List<OneEvent> get planningEvents => [..._planningEvents];

 

  final EventTypesService _eventTypesService = EventTypesService();
  Future<void> _fetchEventTypes() async {
    final fetchedEventsType = await _eventTypesService.fetchEventTypes();
    _eventTypes = fetchedEventsType;
    notifyListeners();
  }

  final EventsService _eventsService = EventsService();
  final String token = '2|ei7vEz3vrdq8wjb18LMVat4MztPVXFMSTF7jkry9389e0d83';

  void addEvent(String name, double budget, int guestsNumber, DateTime date,
      TimeOfDay time, int eventTypeId) {
    _eventsService.addEvent(
        name, budget, guestsNumber, date, time, eventTypeId, token);
        // _fetchEvents();
    notifyListeners();
  }

  Future<void> fetchPlanningEvents() async {
    final fetchedEvents = await _eventsService.showPlanningEvent(token);
    _planningEvents = fetchedEvents;
    notifyListeners();
  }

  Future<void> fetchCompletedEvents() async {
    final fetchedEvents = await _eventsService.showCompletedEvent(token);
    _completedEvents = fetchedEvents;
    notifyListeners();
  }

  void deleteEvent(int eventId) {
    _eventsService.deleteEvent(eventId, token);
          // _fetchEvents();
    notifyListeners();
  }

  void editEvent(
      {String? name,
      double? budget,
      int? guestsNumber,
      TimeOfDay? time,
      DateTime? dateTime,
      int? eventTypeId}) {
    
    // _eventsService.editEvent();
  }

  OneEvent findEventById(int eventId) {
    return _planningEvents.firstWhere((event) => event.eventId == eventId);
  }

  EventType getEventTypeById(int eventTypeId) {
    return _eventTypes.firstWhere((eventType) => eventType.id == eventTypeId);
  }
}

//.........................http................................................
class EventTypesService {
  final String apiUrl = 'http://192.168.1.102:8000/api/event-type';

  Future<List<EventType>> fetchEventTypes() async {
    print('I am in fetchEventTypessssssss and going to get them');

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Accept': 'application/json',
        'locale': 'ar',
      },
    );
    if (response.statusCode == 200) {
      print('I am in the fetchEventTypessssssss 200');
      final data = jsonDecode(response.body);
      final eventTypes = data['data'] as List;
      return eventTypes.map((e) {
        return EventType(id: e['id'], name: e['name']);
      }).toList();
    } else {
      throw Exception('Failed to load event types');
    }
  }

  
}

class EventsService {
  final String apiUrl ='http://192.168.1.102:8000/api/events';
  final String apiUrl1 = 'http://192.168.1.102:8000/api/events/orderBy/planning';
    final String apiUrl2 = 'http://192.168.1.102:8000/api/events/orderBy/completed';


  void addEvent(String name, double budget, int guestsNumber, DateTime date,
      TimeOfDay time, int eventTypeId, String token) async {
    print('I am in addEventttttttttttttttttttttttt and going to get them');
    // Format DateTime and TimeOfDay
    final String formattedDate =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    final String formattedTime =
        '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    print('Formatted time: $formattedTime');

    final response = await http.post(Uri.parse(apiUrl), headers: {
      'Accept': 'application/json',
      'locale': 'ar',
      'Authorization': 'Bearer $token',
    }, body: {
      "name": name,
      "date": formattedDate,
      "time": formattedTime,
      "budget": budget.toString().toString(),
      "guests": guestsNumber.toString(),
      "event_type_id": eventTypeId.toString(),
    });
    if (response.statusCode == 200) {
      print('I am in the addEventttttttttttttttttttttttt 200');
    } else {
      print(response.body);
      throw Exception('Failed addEventttttttttttttttttttttttt');
    }
  }

  void deleteEvent(int eventId, String token) async {
    final String apiUrl2 =
        'http://192.168.1.102:8000/api/events/$eventId/delete';
    print('I am in deleteEventtttttttttttt ');

    final response = await http.delete(
      Uri.parse(apiUrl2),
      headers: {
        'Accept': 'application/json',
        'locale': 'ar',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print('I am in the deleteEventtttttttttttt 200');
    } else {
      print(response.body);
      throw Exception('Failed deleteEventtttttttttttt');
    }
  }

  Future<List<OneEvent>> showPlanningEvent(String token) async {
    print('I am in showEventttttttt ');

    final response = await http.get(
      Uri.parse(apiUrl1),
      headers: {
        'Accept': 'application/json',
        'locale': 'ar',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print('Successfully fetched events');
      final data = jsonDecode(response.body);
      final events = data['data'] as List;

      return events.map((e) {
        final date = DateTime.parse(e['date']);
        final time = TimeOfDay(
          hour: int.parse(e['time'].substring(0, 2)),
          minute: int.parse(e['time'].substring(3, 5)),
        );

        return OneEvent(
          eventId: e['id'],
          name: e['name'],
          budget: e['budget'].toDouble(), // Assuming budget is double
          guestsNumber: e['guests'],
          time: time,
          dateTime: date,
          eventTypeId: e['event_type_id'],
        );
      }).toList();
    } else {
      print(response.body);
      throw Exception('Failed showEventttttttt');
    }
  }

   Future<List<OneEvent>> showCompletedEvent(String token) async {
    print('I am in showEventttttttt ');

    final response = await http.get(
      Uri.parse(apiUrl2),
      headers: {
        'Accept': 'application/json',
        'locale': 'ar',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print('Successfully fetched events');
      final data = jsonDecode(response.body);
      final events = data['data'] as List;

      return events.map((e) {
        final date = DateTime.parse(e['date']);
        final time = TimeOfDay(
          hour: int.parse(e['time'].substring(0, 2)),
          minute: int.parse(e['time'].substring(3, 5)),
        );

        return OneEvent(
          eventId: e['id'],
          name: e['name'],
          budget: e['budget'].toDouble(), // Assuming budget is double
          guestsNumber: e['guests'],
          time: time,
          dateTime: date,
          eventTypeId: e['event_type_id'],
        );
      }).toList();
    } else {
      print(response.body);
      throw Exception('Failed showEventttttttt');
    }
  }


// void editEvent(String? name, double? budget, int? guestsNumber, DateTime? date,TimeOfDay? time, int? eventTypeId, String? token) async {
//     print('I am in addEventttttttttttttttttttttttt and going to get them');
//     // Format DateTime and TimeOfDay
//     final String formattedDate;
//     if(date!=null){
//        formattedDate = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
//     }
//     final String formattedTime ;
//     if(time!=null){
//        formattedTime ='${time.hour}:${time.minute.toString().padLeft(2, '0')}';
//     }

//     final response = await http.post(Uri.parse(apiUrl), headers: {
//       'Accept': 'application/json',
//       'locale': 'ar',
//       'Authorization': 'Bearer $token',
//     }, body: {
//       name!=null? "name": name:,
//       "date": formattedDate:,
//       "time": formattedTime,
//       "budget": budget.toString().toString(),
//       "guests": guestsNumber.toString(),
//       "event_type_id": eventTypeId.toString(),
//     });
//     if (response.statusCode == 200) {
//       print('I am in the addEventttttttttttttttttttttttt 200');
//     } else {
//       print(response.body);
//       throw Exception('Failed addEventttttttttttttttttttttttt');
//     }
//   }

}

//.....................http model...
class EventType {
  final int id;
  final String name;

  EventType({required this.id, required this.name});
}
