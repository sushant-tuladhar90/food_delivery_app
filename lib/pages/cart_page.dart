import 'package:flutter/material.dart';

// Include this line at the top to access the same global variable
// (This should be in a separate file in a real app)
List<Map<String, dynamic>> globalCartItems = [];

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    // No need to copy, we're using the global reference directly
  }

  void updateQuantity(int index, int change) {
    setState(() {
      globalCartItems[index]['quantity'] += change;
      if (globalCartItems[index]['quantity'] < 1) {
        globalCartItems[index]['quantity'] = 1;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      globalCartItems.removeAt(index);
    });
  }

  double getTotalAmount() {
    double subtotal = 0;
    for (var item in globalCartItems) {
      subtotal += item['price'] * item['quantity'];
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = getTotalAmount();
    double serviceTax = 10;
    double deliveryCharge = 100;
    double totalAmount = subtotal + serviceTax + deliveryCharge;

    return WillPopScope(
      // Handle back button press
      onWillPop: () async {
        Navigator.pop(context, globalCartItems);
        return false; // Prevent default back behavior
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.green,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, globalCartItems);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child:
                  globalCartItems.isEmpty
                      ? const Center(
                        child: Text(
                          "Your cart is empty",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                      : ListView.builder(
                        itemCount: globalCartItems.length,
                        itemBuilder: (context, index) {
                          final item = globalCartItems[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Food Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item['image'],
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),

                                // Food Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Name & Delete Button
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item['name'],
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed: () => removeItem(index),
                                          ),
                                        ],
                                      ),

                                      // Description
                                      Text(
                                        item['description'] ??
                                            'No description available',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      const SizedBox(height: 4),

                                      // Rating
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            (item['rating'] ?? "0").toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 8),

                                      // Price & Quantity Controls
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Rs. ${(item['price'] * item['quantity']).toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.remove_circle_outline,
                                                ),
                                                onPressed:
                                                    item['quantity'] > 1
                                                        ? () => updateQuantity(
                                                          index,
                                                          -1,
                                                        )
                                                        : null,
                                              ),
                                              Text(
                                                '${item['quantity']}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.add_circle_outline,
                                                ),
                                                onPressed:
                                                    () => updateQuantity(
                                                      index,
                                                      1,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
            ),

            // Price Summary Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildPriceRow("Subtotal", subtotal),
                  _buildPriceRow("Service Tax", serviceTax),
                  _buildPriceRow("Delivery Charge", deliveryCharge),
                  const Divider(thickness: 1),
                  _buildPriceRow("Amount Payable", totalAmount, isTotal: true),
                  const SizedBox(height: 12),
                  // Proceed to Checkout Button
                  ElevatedButton(
                    onPressed:
                        globalCartItems.isEmpty
                            ? null
                            : () {
                              // Checkout action here
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Proceeding to checkout..."),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      disabledBackgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 60,
                      ),
                    ),
                    child: const Text(
                      "Proceed to Checkout",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isTotal ? Colors.black : Colors.grey[700],
            ),
          ),
          Text(
            "Rs. ${amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isTotal ? Colors.black : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
