import 'package:flutter/material.dart';

class PaymentBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows full-screen modal
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return PaymentSheetContent();
      },
    );
  }
}

class PaymentSheetContent extends StatefulWidget {
  const PaymentSheetContent({super.key});

  @override
  _PaymentSheetContentState createState() => _PaymentSheetContentState();
}

class _PaymentSheetContentState extends State<PaymentSheetContent> {
  final TextEditingController _amountController = TextEditingController();
  bool _isProcessing = false;

  void _processPayment() async {
    setState(() {
      _isProcessing = true;
    });

    // Simulate network delay (mimic Stripe API call)
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _isProcessing = false;
    });

    // Close bottom sheet after "payment"
    if (mounted) {
      Navigator.pop(context);
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Payment Successful"),
          content: Text("Your payment has been processed successfully."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Enter Payment Amount", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter amount (USD)",
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _isProcessing ? null : _processPayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.blue,
              ),
              child: _isProcessing
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Pay"),
            ),
          ),
        ],
      ),
    );
  }
}
