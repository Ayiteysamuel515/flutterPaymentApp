// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'Homepage.dart'; // Import the HomeScreen.dart file

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _amountController = TextEditingController();
  final _telephoneController = TextEditingController();
  String? _selectedPaymentMethod;
  final _paymentMethods = ['Vodafone', 'MTN', 'Airtel', 'Tigo'];
  bool isProcessing = false;

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Payment Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Amount: GHS ${_amountController.text}'),
              Text('Telephone Number: ${_telephoneController.text}'),
              Text(
                  'Payment Method: ${_selectedPaymentMethod ?? "Not selected"}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Proceed with the payment
                _processPayment();
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _processPayment() async {
    setState(() {
      isProcessing = true; // Start the processing
    });

    // Simulate a delay for payment processing (e.g., API call)
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      isProcessing = false; // Stop the processing after the delay
    });

    final amount = double.tryParse(_amountController.text);
    if (amount != null && amount > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Processing payment of GHS ${amount.toStringAsFixed(2)} using $_selectedPaymentMethod for number ${_telephoneController.text}.',
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid amount.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1E2A38),
          elevation: 2,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(Icons.account_circle, color: Colors.white, size: 28),
          ),
        ),
        body: Container(
          color: const Color(0xFF4E586E),
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Make your Payment Here!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Payment Details',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _selectedPaymentMethod,
                          items: _paymentMethods.map((method) {
                            return DropdownMenuItem<String>(
                              value: method,
                              child: Text(method,
                                  style: const TextStyle(fontSize: 14)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Payment Method',
                            labelStyle: const TextStyle(
                                color: Colors.white, fontSize: 14),
                            filled: true,
                            fillColor: const Color(0xFF2A3442),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          dropdownColor: const Color(0xFF4E586E),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _telephoneController,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          decoration: InputDecoration(
                            labelText: 'Telephone Number',
                            labelStyle: const TextStyle(
                                color: Colors.white, fontSize: 14),
                            filled: true,
                            fillColor: const Color(0xFF2A3442),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _amountController,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      labelText: 'Amount (GHS)',
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 14),
                      filled: true,
                      fillColor: const Color(0xFF2A3442),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedPaymentMethod == null ||
                          _amountController.text.isEmpty ||
                          _telephoneController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please select a payment method, enter amount, and telephone number.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        _showConfirmationDialog();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD428),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                    ),
                    child: isProcessing
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 122, 106, 106)),
                          )
                        : const Text(
                            'Pay Now',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                  ),
                  const SizedBox(height: 20), // Space before footer
                ],
              ),
            ),
          ),
        ),
        // Footer Section
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF1E2A38), // Dark color for footer
          selectedItemColor:
              const Color(0xFFFFD428), // Yellow for selected items
          unselectedItemColor: Colors.grey, // Grey for unselected items
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, size: 24),
              label: 'Notify',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout, size: 24),
              label: 'Logout',
            ),
          ],
          onTap: (index) {
            if (index == 0) {
              // Navigate to the HomeScreen when "Home" is tapped
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            } else if (index == 2) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Viewing Notifications')),
              );
            }
          },
        ),
      ),
    );
  }
}
