import 'package:flutter/material.dart';
import 'package:food_ordering_app/delivery/add_new_address.dart';
import 'package:food_ordering_app/payment/payment_method.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  // Sample saved addresses
  final List<Map<String, dynamic>> addresses = [
    {
      'id': 1,
      'name': 'Home',
      'address': 'Biratnagar, Nepal',
      'city': 'Biratnagar',
      'pincode': '00001',
      'isDefault': true,
    },
    {
      'id': 2,
      'name': 'Office',
      'address': 'Ithari, Nepal',
      'city': 'Ithari',
      'pincode': '00002',
      'isDefault': false,
    },
    {
      'id': 3,
      'name': 'Parent\'s House',
      'address': 'Biratnagar, Nepal',
      'city': 'Biratnagar',
      'pincode': '00003',
      'isDefault': false,
    },
  ];

  int selectedAddressId = 1; // Default selected address

  void setDefaultAddress(int id) {
    setState(() {
      for (var address in addresses) {
        address['isDefault'] = address['id'] == id;
      }
      selectedAddressId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Delivery Address"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background design element
          // Positioned(
          //   top: -100,
          //   right: -50,
          //   child: Container(
          //     width: 200,
          //     height: 200,
          //     decoration: const BoxDecoration(
          //       color: Color(0x15009688),
          //       shape: BoxShape.circle,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: -80,
          //   left: -80,
          //   child: Container(
          //     width: 200,
          //     height: 200,
          //     decoration: const BoxDecoration(
          //       color: Color(0x15009688),
          //       shape: BoxShape.circle,
          //     ),
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Delivery Location",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Select an address for delivery or add a new one",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              // Saved Addresses List
              Expanded(
                child:
                    addresses.isEmpty
                        ? const Center(
                          child: Text(
                            "No saved addresses found",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                        : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          itemCount: addresses.length,
                          itemBuilder: (context, index) {
                            final address = addresses[index];
                            final isSelected =
                                address['id'] == selectedAddressId;

                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? Colors.green
                                          : Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedAddressId = address['id'];
                                  });
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Title and Type badge
                                      Row(
                                        children: [
                                          // Radio button
                                          Radio(
                                            value: address['id'],
                                            groupValue: selectedAddressId,
                                            activeColor: Colors.green,
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedAddressId =
                                                    value as int;
                                              });
                                            },
                                          ),

                                          // Address Name
                                          Text(
                                            address['name'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          const SizedBox(width: 8),

                                          // Default badge
                                          if (address['isDefault'])
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.green.withOpacity(
                                                  0.1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: const Text(
                                                "DEFAULT",
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),

                                      const SizedBox(height: 4),

                                      // Address details
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 40,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              address['address'],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              "${address['city']} - ${address['pincode']}",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey[600],
                                              ),
                                            ),

                                            const SizedBox(height: 12),

                                            // Action buttons
                                            Row(
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      // TODO: Navigate to edit page
                                                    },
                                                    style: OutlinedButton.styleFrom(
                                                      foregroundColor:
                                                          Colors.black87,
                                                      side: BorderSide(
                                                        color:
                                                            Colors.grey[300]!,
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              6,
                                                            ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 0,
                                                          ),
                                                    ),
                                                    child: const Text(
                                                      "EDIT",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                if (!address['isDefault'])
                                                  SizedBox(
                                                    height: 30,
                                                    child: OutlinedButton(
                                                      onPressed:
                                                          () =>
                                                              setDefaultAddress(
                                                                address['id'],
                                                              ),
                                                      style: OutlinedButton.styleFrom(
                                                        foregroundColor:
                                                            Colors.green,
                                                        side: const BorderSide(
                                                          color: Colors.green,
                                                        ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                6,
                                                              ),
                                                        ),
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 12,
                                                              vertical: 0,
                                                            ),
                                                      ),
                                                      child: const Text(
                                                        "SET AS DEFAULT",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ],
      ),
      // Add new address button
      floatingActionButton: FloatingActionButton.extended(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNewAddress()),
            ),
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add),
        label: const Text("Add New Address"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // Return selected address to previous screen
            Navigator.pop(context, selectedAddressId);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentMethod()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Proceed to Checkout",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
