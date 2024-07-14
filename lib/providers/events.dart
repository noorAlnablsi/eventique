import 'package:eventique/models/one_event.dart';
import 'package:flutter/material.dart';

class Events with ChangeNotifier {
  final List<OneEvent> _events = [];

  List<OneEvent> get events {
    return [..._events];
  }

  List<OneEvent> get planningEvents {
    return _events.where((event) => event.dateTime.isAfter(DateTime.now())).toList();
  }

  List<OneEvent> get completedEvents {
    return _events.where((event) => event.dateTime.isBefore(DateTime.now())).toList();
  }

  void addEvent(OneEvent event) {
    _events.insert(0, event);
    notifyListeners();
  }

  void deleteEvent(String eventId) {
    _events.removeWhere((event) => event.eventId == eventId);
    notifyListeners();
  }

 void editEvent(String eventId, {String? name, double? budget, int? guestsNumber, TimeOfDay? time, DateTime? dateTime, EventType? eventType}) {
    final event = _events.firstWhere((event) => event.eventId == eventId);
    final updatedEvent = OneEvent(
      eventId: event.eventId,
      name: name ?? event.name,
      budget: budget ?? event.budget,
      guestsNumber: guestsNumber ?? event.guestsNumber,
      time: time ?? event.time,
      dateTime: dateTime ?? event.dateTime,
      eventType: eventType ?? event.eventType,
    );
    final eventIndex = _events.indexOf(event);
    _events[eventIndex] = updatedEvent;
    notifyListeners();
  }
}
