import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/restaurants/hotel_details.dart';

class Hotels extends StatefulWidget {
  const Hotels({super.key});

  @override
  State<Hotels> createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  List<Map<String, dynamic>> hotelItems = [
    {
      "image": "assets/images/hotel.webp",
      "name": "Big Hotel",
      "address": "Biratnagar, Nepal",
      "rating": 4.5,
    },
    {
      "image": "assets/images/hotel1.webp",
      "name": "Gorkha Department",
      "address": "Ithari, Nepal",
      "rating": 4.7,
    },
    {
      "image": "assets/images/hotel2.webp",
      "name": "Solti Hotel",
      "address": "Kathmandu, Nepal",
      "rating": 4.6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hotels"), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: hotelItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return _buildHotelCard(index);
          },
        ),
      ),
    );
  }

  Widget _buildHotelCard(int index) {
    final hotel = hotelItems[index];
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => HotelsDetails(
                    image: hotel["image"],
                    hotel: hotel["name"],
                    address: hotel["address"],
                    rating: hotel["rating"],
                  ),
            ),
          ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      hotel["image"],
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                hotel["name"],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                hotel["address"],
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "${hotel["rating"]}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
