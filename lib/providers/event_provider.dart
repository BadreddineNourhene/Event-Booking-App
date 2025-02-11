// import 'dart:convert';
// import 'package:events4/main.dart';
// import 'package:events4/models/event.dart';
// import 'package:flutter/material.dart';
// // --- Provider Class ---
// class EventProvider with ChangeNotifier {
//   List<Event> _events = [];
//   List<Event> _filteredEvents = [];
//   final List<int> _cart = [];

//   EventProvider() {
//     _loadEvents();
//   }

//   void _loadEvents() {
//     final List<dynamic> data = json.decode(mockEventData);
//     _events = data.map((json) => Event.fromJson(json)).toList();
//     _filteredEvents = List.from(_events);
//     notifyListeners();
//   }

//   List<Event> get events => _filteredEvents;
//   List<int> get cart => _cart;

//   void searchEvents(String query) {
//     if (query.isEmpty) {
//       _filteredEvents = List.from(_events);
//     } else {
//       _filteredEvents = _events
//           .where((event) =>
//               event.title.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }

//   void toggleCart(int eventId) {
//     if (_cart.contains(eventId)) {
//       _cart.remove(eventId);
//     } else {
//       _cart.add(eventId);
//     }
//     notifyListeners();
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'package:events4/models/event.dart';



class EventProvider with ChangeNotifier {
  List<Event> _events = [];
  List<Event> _filteredEvents = [];
  final List<int> _cart = [];

  EventProvider() {
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    try {
      final String response = await rootBundle.loadString('assets/json/data_event.json');
      final List<dynamic> data = json.decode(response);
      _events = data.map((json) => Event.fromJson(json)).toList();
      _filteredEvents = List.from(_events);
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading events: $e');
    }
  }

  List<Event> get events => _filteredEvents;
  List<int> get cart => _cart;

  void searchEvents(String query) {
    if (query.isEmpty) {
      _filteredEvents = List.from(_events);
    } else {
      _filteredEvents = _events
          .where((event) =>
              event.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void toggleCart(int eventId) {
    if (_cart.contains(eventId)) {
      _cart.remove(eventId);
    } else {
      _cart.add(eventId);
    }
    notifyListeners();
  }
  
  
}
