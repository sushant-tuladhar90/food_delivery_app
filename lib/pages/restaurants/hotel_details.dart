import 'package:flutter/material.dart';
import '../cart_page.dart'; // Import the CartPage

class HotelsDetails extends StatefulWidget {
  final String image;
  final String hotel;
  final double rating;
  final String address;

  const HotelsDetails({
    super.key,
    required this.image,
    required this.hotel,
    required this.rating,
    required this.address,
  });

  @override
  State<HotelsDetails> createState() => _HotelsDetailsState();
}

class _HotelsDetailsState extends State<HotelsDetails> {
  int nights = 1;
  bool isFavorite = false;
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
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

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.hotel,
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

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('Rs. ${widget.price}/night',
                    //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    //     Row(
                    //       children: [
                    //         IconButton(
                    //           icon: Icon(Icons.remove_circle_outline),
                    //           onPressed: nights > 1
                    //               ? () {
                    //                   setState(() {
                    //                     nights--;
                    //                   });
                    //                 }
                    //               : null,
                    //         ),
                    //         Text('$nights', style: TextStyle(fontSize: 16)),
                    //         IconButton(
                    //           icon: Icon(Icons.add_circle_outline),
                    //           onPressed: () {
                    //             setState(() {
                    //               nights++;
                    //             });
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 12),

                    Text(
                      "Location",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.address,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: MediaQuery.of(context).size.height * 0.001,
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Total Price",
                  //         style: TextStyle(fontSize: 14, color: Colors.grey),
                  //       ),
                  //       // Text("Rs. ${(widget.price * nights).toStringAsFixed(2)}",
                  //       //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                  //     ],
                  //   ),
                  // ),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.08,
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
                            'name': widget.hotel,
                            // 'price': widget.price,
                            'nights': nights,
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
                        "Book Now",
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
