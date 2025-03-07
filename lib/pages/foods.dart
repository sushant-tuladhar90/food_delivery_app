import 'package:flutter/material.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  List<Map<String, dynamic>> foodItems = [
    {
      "image": "assets/images/food.webp",
      "title": "Burger On Plate",
      "description": "Make this grilling season...",
      "rating": 4.5,
      "price": 500,
    },
    {
      "image": "assets/images/food1.webp",
      "title": "Pizza Delight",
      "description": "Cheesy and delicious...",
      "rating": 4.7,
      "price": 700,
    },
    {
      "image": "assets/images/food2.webp",
      "title": "Pasta Special",
      "description": "Creamy and full of flavor...",
      "rating": 4.6,
      "price": 600,
    },
    {
      "image": "assets/images/food.webp",
      "title": "Burger On Plate",
      "description": "Make this grilling season...",
      "rating": 4.5,
      "price": 500,
    },
    {
      "image": "assets/images/food1.webp",
      "title": "Pizza Delight",
      "description": "Cheesy and delicious...",
      "rating": 4.7,
      "price": 700,
    },
    {
      "image": "assets/images/food2.webp",
      "title": "Pasta Special",
      "description": "Creamy and full of flavor...",
      "rating": 4.6,
      "price": 600,
    },
    {
      "image": "assets/images/food2.webp",
      "title": "Pasta Special",
      "description": "Creamy and full of flavor...",
      "rating": 4.6,
      "price": 600,
    },
    {
      "image": "assets/images/food.webp",
      "title": "Burger On Plate",
      "description": "Make this grilling season...",
      "rating": 4.5,
      "price": 500,
    },
    {
      "image": "assets/images/food1.webp",
      "title": "Pizza Delight",
      "description": "Cheesy and delicious...",
      "rating": 4.7,
      "price": 700,
    },
    {
      "image": "assets/images/food2.webp",
      "title": "Pasta Special",
      "description": "Creamy and full of flavor...",
      "rating": 4.6,
      "price": 600,
    },
    {
      "image": "assets/images/food1.webp",
      "title": "Pizza Delight",
      "description": "Cheesy and delicious...",
      "rating": 4.7,
      "price": 700,
    },
    {
      "image": "assets/images/food2.webp",
      "title": "Pasta Special",
      "description": "Creamy and full of flavor...",
      "rating": 4.6,
      "price": 600,
    },
    {
      "image": "assets/images/food2.webp",
      "title": "Pasta Special",
      "description": "Creamy and full of flavor...",
      "rating": 4.6,
      "price": 600,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Foods"), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        // Make the entire body scrollable
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            shrinkWrap: true, // Ensures GridView takes up only necessary space
            physics:
                NeverScrollableScrollPhysics(), // Prevents GridView from scrolling independently
            itemCount: foodItems.length, // Ensure this matches the list length
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items per row
              crossAxisSpacing: 10, // Space between columns
              mainAxisSpacing: 10, // Space between rows
              childAspectRatio: 0.75, // Adjust height vs width ratio
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
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(8),
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
                    height: 100, // Adjusted image height
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                //
              ],
            ),
            SizedBox(height: 8),

            // Title
            Text(
              foodItems[index]["title"],
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),

            // Subtitle
            Text(
              foodItems[index]["description"],
              style: TextStyle(fontSize: 12, color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 6),

            // Rating and Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "${foodItems[index]["rating"]}",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Text(
                  "Rs. ${foodItems[index]["price"]}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
