import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/review_page.dart';
// Import the CartPage

class FoodsDetails extends StatefulWidget {
  final String image;
  final String name;
  final double rating;
  final double price;
  final String description;
  final List<Map<String, dynamic>>
  initialCartItems; // New parameter for initial cart items

  const FoodsDetails({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
    this.initialCartItems = const [], // Default empty list if not provided
  });

  @override
  State<FoodsDetails> createState() => _FoodsDetailsState();
}

class _FoodsDetailsState extends State<FoodsDetails> {
  int quantity = 1;
  String selectedSize = 'Medium';
  bool isFavorite = false;
  late List<Map<String, dynamic>> cartItems; // List to store cart items

  @override
  void initState() {
    super.initState();
    // Initialize cart with items passed from constructor or empty list
    cartItems = List.from(widget.initialCartItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Image Section
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image), // Displaying the image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _buildIconButton(
                  Icons.arrow_back,
                  () => Navigator.pop(
                    context,
                    cartItems,
                  ), // Return cart items when going back
                  top: 20,
                  left: 10,
                ),
                _buildIconButton(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  top: 20,
                  right: 60,
                ),
                _buildIconButton(Icons.share, () {}, top: 20, right: 10),
              ],
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name & Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.rating.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Price and Quantity
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rs. ${widget.price}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed:
                                  quantity > 1
                                      ? () {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                      : null,
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Reviews Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Reviews",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ReviewPage(),
                                ),
                              ),
                          child: const Text(
                            "View All",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildReview(
                      "John Doe",
                      "2025-03-08",
                      4.5,
                      "The food was delicious and well prepared!",
                    ),
                    _buildReview(
                      "Alice Smith",
                      "2025-03-07",
                      5.0,
                      "Amazing taste, great presentation! Will order again.",
                    ),
                    _buildReview(
                      "Michael Brown",
                      "2025-03-06",
                      4.0,
                      "Good portion size, but could be a bit spicier.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Sticky Bottom Navigation Bar (Fixed)
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical:
                  MediaQuery.of(context).size.height * 0.001, // Dynamic padding
            ),
            child: IntrinsicHeight(
              // Adapts to content size
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ✅ Expanded to prevent layout breaking
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total Price",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          "Rs. ${(widget.price * quantity).toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ✅ Flexible Button to prevent overflow
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width *
                              0.08, // Adjust width dynamically
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Add the current item to cart
                        bool itemExists = false;
                        int existingIndex = -1;

                        // Check if the item already exists in the cart
                        for (int i = 0; i < cartItems.length; i++) {
                          if (cartItems[i]['name'] == widget.name) {
                            itemExists = true;
                            existingIndex = i;
                            break;
                          }
                        }

                        setState(() {
                          if (itemExists) {
                            // Update quantity if item already exists
                            cartItems[existingIndex]['quantity'] += quantity;
                          } else {
                            // Add new item if it doesn't exist
                            cartItems.add({
                              'image': widget.image,
                              'name': widget.name,
                              'price': widget.price,
                              'quantity': quantity,
                              'description': widget.description,
                              'rating': widget.rating,
                            });
                          }
                        });

                        // Navigate to cart page and handle returned cart items
                        // Navigator.push<List<Map<String, dynamic>>>(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder:
                        //         (context) => CartPage(cartItems: cartItems),
                        //   ),
                        // ).then((returnedItems) {
                        //   if (returnedItems != null) {
                        //     setState(() {
                        //       cartItems = returnedItems;
                        //     });
                        //   }
                        // });
                      },
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildReview(String name, String date, double rating, String comment) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 5,
          spreadRadius: 1,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name and Rating
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 18),
                const SizedBox(width: 4),
                Text(
                  "$rating",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(date, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 8),
        Text(
          comment,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    ),
  );
}

Widget _buildIconButton(
  IconData icon,
  VoidCallback onPressed, {
  double top = 0,
  double left = 0,
  double right = 0,
}) {
  return Positioned(
    top: top,
    left: left > 0 ? left : null,
    right: right > 0 ? right : null,
    child: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: onPressed,
        ),
      ),
    ),
  );
}
