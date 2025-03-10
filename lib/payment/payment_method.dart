import 'package:flutter/material.dart';
import 'package:food_ordering_app/constants/esewa.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String selectedPaymentMethod = 'Credit Card';
  // You would likely receive this from your CartPage in a real app
  double totalAmount = 855.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Payment Method")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   "Choose Payment Method",
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // ),
                  const SizedBox(height: 5),

                  // Credit Card
                  _buildPaymentOption(
                    'Credit Card',
                    Icons.credit_card,
                    'Credit Card',
                  ),

                  // E-Sewa
                  _buildPaymentOption(
                    'E-Sewa',
                    Icons.account_balance_wallet,
                    'E-Sewa',
                    color: Colors.green,
                  ),

                  // Khalti
                  _buildPaymentOption(
                    'Khalti',
                    Icons.payment,
                    'Khalti',
                    color: Colors.purple,
                  ),

                  // IME Pay
                  _buildPaymentOption(
                    'IME Pay',
                    Icons.swap_horiz,
                    'IME Pay',
                    color: Colors.orange,
                  ),

                  // Google Pay
                  _buildPaymentOption(
                    'Google Pay',
                    Icons.g_mobiledata,
                    'Google Pay',
                    color: Colors.blue,
                  ),

                  // Cash On Delivery
                  _buildPaymentOption(
                    'Cash On Delivery',
                    Icons.delivery_dining,
                    'Cash On Delivery',
                  ),

                  // Wallet
                  _buildPaymentOption(
                    'Wallet',
                    Icons.account_balance_wallet,
                    'Wallet',
                  ),
                ],
              ),
            ),
          ),

          // Bottom section with total amount and continue button
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Amount:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rs. ${totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle payment process
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       'Processing payment via $selectedPaymentMethod',
                      //     ),
                      //     duration: const Duration(seconds: 2),
                      //   ),
                      // );
                      Esewa esewa = Esewa();
                      esewa.pay();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
    String title,
    IconData icon,
    String value, {
    Color color = Colors.black54,
  }) {
    bool isSelected = selectedPaymentMethod == value;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedPaymentMethod = value;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Radio<String>(
                value: value,
                groupValue: selectedPaymentMethod,
                onChanged: (newValue) {
                  setState(() {
                    selectedPaymentMethod = newValue!;
                  });
                },
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
