import 'dart:convert';
import 'package:events4/const/const.dart';
import 'package:events4/models/event.dart';
import 'package:events4/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// --- Event Widget ---
class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final isInCart = provider.cart.contains(event.id);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(event.image, height: 80, fit: BoxFit.cover),
          Text(event.title, style: AppTextStyles.title),
          Text(event.description, style: AppTextStyles.body),
          Text("Date: ${event.date}", style: AppTextStyles.subtitle),
          Text("\$${event.price}", style: AppTextStyles.subtitle),
          TextButton(
            onPressed: () => provider.toggleCart(event.id),
            child: Text(isInCart ? "Remove from Cart" : "Add to Cart"),
          ),
        ],
      ),
    );
  }
}