import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/restaurants/hotel_details.dart';

class Restaurants extends StatefulWidget {
  const Restaurants({super.key});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  List<Map<String, dynamic>> hotelItems = [
    {
      "image": "assets/images/hotel.webp",
      "hotel": "Big Hotel",
      "address": "Biratnagar, Nepal",
      "rating": 4,
    },
    {
      "image": "assets/images/hotel1.webp",
      "hotel": "Gorkha ",
      "address": "Ithari, Nepal",
      "rating": 3,
    },
    {
      "image": "assets/images/hotel2.webp",
      "hotel": "Solti Hotel",
      "address": "Kathmandu, Nepal",
      "rating": 5,
    },
    {
      "image": "assets/images/hotel.webp",
      "hotel": "Big Hotel",
      "address": "Biratnagar, Nepal",
      "rating": 4,
    },
    {
      "image": "assets/images/hotel1.webp",
      "hotel": "Gorkha ",
      "address": "Ithari, Nepal",
      "rating": 3,
    },
    {
      "image": "assets/images/hotel2.webp",
      "hotel": "Solti Hotel",
      "address": "Kathmandu, Nepal",
      "rating": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Restaurants")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: hotelItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85, // Adjust height vs width ratio
            ),
            itemBuilder: (context, index) {
              return _buildFoodCard(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFoodCard(int index) {
    final hotel = hotelItems[index];
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => HotelsDetails(
                    image:
                        hotel["image"] ??
                        "assets/images/hotel.webp", // Default image
                    hotel: hotel["hotel"] ?? "Unknown Hotel",
                    address: hotel["address"] ?? "No Address Available",
                    rating:
                        hotel["rating"]?.toDouble() ??
                        0.0, // Convert to double safely
                  ),
            ),
          ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          // Set the fixed height and width for the card
          height: 190, // Fixed height for each card
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with fixed size
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    hotelItems[index]["image"],
                    height: 100, // Adjust image height
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),

                // Title
                Text(
                  hotelItems[index]["hotel"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),

                // Address
                Text(
                  hotelItems[index]["address"],
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6),

                // Rating Row
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "${hotelItems[index]["rating"]}",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
