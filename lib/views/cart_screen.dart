import 'package:events4/const/const.dart';
import 'package:events4/models/event.dart';
import 'package:events4/providers/auth_provider.dart';
import 'package:events4/providers/event_provider.dart';
import 'package:events4/views/event_detail_page.dart';
import 'package:events4/views/login.dart';
import 'package:events4/views/payment_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final cartEvents = provider.events.where((event) => provider.cart.contains(event.id)).toList();
    final totalAmount = cartEvents.fold(0.0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: AppTextStyles.largeTitle),
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "\$${totalAmount.toStringAsFixed(2)}",
                style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: cartEvents.isEmpty
          ? Center(
              child: Text("Your cart is empty", style: AppTextStyles.body),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartEvents.length,
                    itemBuilder: (context, index) {
                      final event = cartEvents[index];
                      return CartItem(event: event);
                    },
                  ),
                ),

                // Checkout Button
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: PrimaryButton(
                    title: "Proceed to Payment",
                    onPressed: () {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      if (authProvider.isLoggedIn) {
        PaymentBottomSheet.show(context);
      } else {
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text("Please log in to book tickets."),
    action: SnackBarAction(
      label: "Login",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    ),
  ),
);


      }
    },


                  ),
                ),
              ],
            ),
    );
  }
}

// --- Cart Item Widget ---
class CartItem extends StatelessWidget {
  final Event event;

  const CartItem({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Event Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              event.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          // Title & Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.title, style: AppTextStyles.title),
                const SizedBox(height: 4),
                Text(event.description, style: AppTextStyles.body, maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),

          // Remove Icon
          IconButton(
            icon: Icon(Icons.close, color: AppColors.black),
            onPressed: () => provider.toggleCart(event.id),
          ),
        ],
      ),
    );
  }
}
