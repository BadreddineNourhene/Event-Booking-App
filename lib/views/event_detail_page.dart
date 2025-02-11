import 'package:events4/const/const.dart';
import 'package:events4/models/event.dart';
import 'package:events4/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EventDetailPage extends StatelessWidget {
  final Event event;

  const EventDetailPage({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final isInCart = provider.cart.contains(event.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title, style: AppTextStyles.largeTitle),
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: AppColors.black),
                onPressed: () {},
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
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image Banner
          Image.network(
            event.image,
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),

          // Event Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.title, style: AppTextStyles.largeTitle),
                const SizedBox(height: 8),
                Text(event.description, style: AppTextStyles.body),
                const SizedBox(height: 8),
                Text("Date: ${event.date}", style: AppTextStyles.subtitle),
              ],
            ),
          ),

          const Spacer(),

          // Add to Cart Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              title: isInCart ? "Remove from Cart" : "Add to Cart",
              onPressed: () {
                provider.toggleCart(event.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// --- Primary Button Widget ---
class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PrimaryButton({required this.title, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.white,
        ),
        onPressed: onPressed,
        child: Text(title, style: AppTextStyles.button),
      ),
    );
  }
}
