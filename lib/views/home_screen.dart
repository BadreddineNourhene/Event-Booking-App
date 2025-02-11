import 'dart:convert';
import 'package:events4/const/const.dart';
import 'package:events4/providers/event_provider.dart';
import 'package:events4/views/cart_screen.dart';
import 'package:events4/views/event.dart';
import 'package:events4/views/event_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// --- Home Screen ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get event => null;

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Events", style: AppTextStyles.title),
            backgroundColor: AppColors.white,
            elevation: 0,
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart, color: AppColors.black),
                    onPressed: () { Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ),
                       );},
                  ),
                  if (provider.cart.isNotEmpty)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: AppColors.black,
                        child: Text(
                          provider.cart.length.toString(),
                          style: TextStyle(fontSize: 12, color: AppColors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: provider.searchEvents,
                  decoration: InputDecoration(
                    hintText: "Search events...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: provider.events.length,
                  itemBuilder: (context, index) {
                    final event = provider.events[index];
                    return GestureDetector(
                      onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailPage(event: event),
                            ),
                          );
                      },
                      child: EventWidget(event: event));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
