import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/restaurants.dart';

class RestaurantNearYou extends StatefulWidget {
  const RestaurantNearYou({super.key});

  @override
  State<RestaurantNearYou> createState() => _RestaurantNearYouState();
}

class _RestaurantNearYouState extends State<RestaurantNearYou> {
  List<bool> favoriteStatus = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Restaurants Near You",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Restaurants()),
                      ),
                  child: Text(
                    "See more",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          /// 🛠 Fix Overflow: Wrap in SizedBox with a fixed height
          SizedBox(
            height: 250, // Increased height slightly to prevent clipping
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                3,
                (index) => _buildRestaurantCard(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(int index) {
    List<Map<String, dynamic>> foodItems = [
      {
        "image": "assets/images/hotel.webp",
        "hotel": "Big Hotel",
        "city": "Biratnagar, Nepal",
        "rating": 4,
      },
      {
        "image": "assets/images/hotel1.webp",
        "hotel": "Gorkha Department",
        "city": "Ithari, Nepal",
        "rating": 3,
      },
      {
        "image": "assets/images/hotel2.webp",
        "hotel": "Solti Hotel",
        "city": "Kathmandu, Nepal",
        "rating": 5,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          // 🛠 Fixed height for Card to prevent overflow
          width: 200,
          height: 230, // Fixed card height
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with favorite icon
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        foodItems[index]["image"],
                        height: 120, // Reduced image height
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            favoriteStatus[index] = !favoriteStatus[index];
                          });
                        },
                        child: Icon(
                          favoriteStatus[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              favoriteStatus[index] ? Colors.red : Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                // Title
                Text(
                  foodItems[index]["hotel"],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1, // Limit to 1 line to prevent overflow
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),

                // Subtitle
                Text(
                  foodItems[index]["city"],
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                  maxLines: 1, // Limit description to prevent overflow
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),

                // Rating and Price Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 18),
                        SizedBox(width: 5),
                        Text(
                          "${foodItems[index]["rating"]}",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
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
