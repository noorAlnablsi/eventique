//tasneem
import 'package:flutter/material.dart';

enum EventType { birthday, wedding, engagement, holiday }

extension EventTypeExtension on EventType {
  IconData get icon {
    switch (this) {
      case EventType.birthday:
        return Icons.cake;
      case EventType.wedding:
        return Icons.celebration;
      case EventType.engagement:
        return Icons.ring_volume;
      case EventType.holiday:
        return Icons.beach_access;
      default:
        return Icons.event;
    }
  }
}

class OneEvent {
  final String eventId;
  final String name;
  final double budget;
  final int guestsNumber;
  final TimeOfDay time;
  final DateTime dateTime;
  final EventType eventType;

  OneEvent({
    required this.eventId,
    required this.name,
    required this.budget,
    required this.guestsNumber,
    required this.time,
    required this.dateTime,
    required this.eventType,
  });
}
