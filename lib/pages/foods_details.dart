import 'package:flutter/material.dart';
import 'cart_page.dart'; // Import the CartPage

class FoodsDetails extends StatefulWidget {
  final String image;
  final String name;
  final double rating;
  final double price;
  final String description;

  const FoodsDetails({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
  });

  @override
  State<FoodsDetails> createState() => _FoodsDetailsState();
}

class _FoodsDetailsState extends State<FoodsDetails> {
  int quantity = 1;
  String selectedSize = 'Medium';
  bool isFavorite = false;
  List<Map<String, dynamic>> cartItems = []; // List to store cart items

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
                  () => Navigator.pop(context),
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
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 18),
                            SizedBox(width: 4),
                            Text(
                              widget.rating.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Price and Quantity
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rs. ${widget.price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed:
                                  quantity > 1
                                      ? () {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                      : null,
                            ),
                            Text('$quantity', style: TextStyle(fontSize: 16)),
                            IconButton(
                              icon: Icon(Icons.add_circle_outline),
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
                    SizedBox(height: 12),

                    // Description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Select Size
                    Text(
                      "Select Size",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSizeOption("Small"),
                        _buildSizeOption("Medium"),
                        _buildSizeOption("Large"),
                      ],
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
                        Text(
                          "Total Price",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          "Rs. ${(widget.price * quantity).toStringAsFixed(2)}",
                          style: TextStyle(
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
                        setState(() {
                          cartItems.add({
                            'image': widget.image,
                            'name': widget.name,
                            'price': widget.price,
                            'quantity': quantity,
                          });
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => CartPage(cartItems: cartItems),
                          ),
                        );
                      },
                      child: Text(
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

  // Function to build a size option
  Widget _buildSizeOption(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selectedSize == size ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: selectedSize == size ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  // Function to build an icon button with background
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
}
