import 'package:flutter/material.dart';

class CategoryDetails extends StatefulWidget {
  final String categoryName; // Receive category name

  const CategoryDetails({super.key, required this.categoryName});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<Map<String, dynamic>> foodItems = [
    {
      "image": "assets/images/food.webp",
      "title": "Burger On Plate",
      "description": "Make this grilling season...",
      "rating": 4.5,
      "price": 500,
      "category": "Burger",
    },
    {
      "image": "assets/images/food1.webp",
      "title": "Pizza Delight",
      "description": "Cheesy and delicious...",
      "rating": 4.7,
      "price": 700,
      "category": "Pizza",
    },
    {
      "image": "assets/images/food2.webp",
      "title": "Pasta Special",
      "description": "Creamy and full of flavor...",
      "rating": 4.6,
      "price": 600,
      "category": "Pasta",
    },
    {
      "image": "assets/images/food3.webp",
      "title": "Chilled Beer",
      "description": "Refreshing and cool...",
      "rating": 4.8,
      "price": 350,
      "category": "Beer",
    },
    {
      "image": "assets/images/food4.webp",
      "title": "Grilled Chicken",
      "description": "Perfectly seasoned...",
      "rating": 4.9,
      "price": 650,
      "category": "Chicken",
    },
    {
      "image": "assets/images/food5.webp",
      "title": "Sweet Dessert",
      "description": "A treat for your taste buds...",
      "rating": 4.6,
      "price": 450,
      "category": "Desert",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter food items based on selected category
    List<Map<String, dynamic>> filteredItems =
        foodItems
            .where((item) => item["category"] == widget.categoryName)
            .toList();

    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)), // Dynamic title
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: filteredItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return _buildFoodCard(filteredItems[index]);
          },
        ),
      ),
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> foodItem) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                foodItem["image"],
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              foodItem["title"],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              foodItem["description"],
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
                      "${foodItem["rating"]}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Text(
                  "Rs. ${foodItem["price"]}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
