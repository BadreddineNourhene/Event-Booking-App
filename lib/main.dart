import 'package:events4/providers/auth_provider.dart';
import 'package:events4/providers/event_provider.dart';
import 'package:events4/views/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// // --- Mock JSON Data (Normally this would be in a separate file) ---
// const String mockEventData = '''
// [
//   {"id": 1, "title": "Music Concert", "description": "Live music event", "date": "2025-03-10", "price": 20.0, "image": "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
//   {"id": 2, "title": "Tech Expo", "description": "Showcasing latest tech", "date": "2025-04-15", "price": 15.0, "image": "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
//   {"id": 3, "title": "Art Exhibition", "description": "Modern art gallery", "date": "2025-02-28", "price": 10.0, "image": "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
//   {"id": 4, "title": "Food Festival", "description": "Culinary delights", "date": "2025-05-05", "price": 5.0, "image": "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
//   {"id": 5, "title": "Marathon", "description": "Annual city marathon", "date": "2025-06-20", "price": 30.0, "image": "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
//   {"id": 6, "title": "Film Premiere", "description": "Exclusive movie screening", "date": "2025-07-12", "price": 25.0, "image": "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
//   {"id": 7, "title": "Business Summit", "description": "Networking event", "date": "2025-08-15", "price": 50.0, "image": "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
//   {"id": 8, "title": "Yoga Retreat", "description": "Relaxing yoga experience", "date": "2025-09-10", "price": 40.0, "image": "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
//   {"id": 9, "title": "Science Fair", "description": "Innovative science projects", "date": "2025-10-05", "price": 8.0, "image": "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
//   {"id": 10, "title": "Comedy Night", "description": "Stand-up comedy", "date": "2025-11-22", "price": 12.0, "image": "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"}
// ]
// ''';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => EventProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    ),
  );
}



