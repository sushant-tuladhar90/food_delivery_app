import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/foods/foods_details.dart';

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
      "description":
          "Lorem jenbufenf efinb eifnhuebnrfv fwhv uehvu wfdnv8uebrfv efnvu8bef vun efnv8usebfnv eifhnbv8 uesfbhv efivbn8e ufbhv",
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Foods"), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: foodItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.9,
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
    final food = foodItems[index];
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => FoodsDetails(
                    image: food["image"],
                    name: food["title"],
                    rating: food["rating"],
                    price:
                        (food["price"] as int)
                            .toDouble(), // Convert price to double
                    description: food["description"],
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
                      food["image"],
                      height: 100, // Adjust image height
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                food["title"],
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                food["description"],
                style: TextStyle(fontSize: 12, color: Colors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text("${food["rating"]}", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Text(
                    "Rs. ${food["price"].toString()}", // Convert price to string
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
