import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/foods/foods.dart';

class ProductOrdered extends StatefulWidget {
  const ProductOrdered({super.key});

  @override
  State<ProductOrdered> createState() => _ProductOrderedState();
}

class _ProductOrderedState extends State<ProductOrdered> {
  // List of food items
  final List<Map<String, dynamic>> foodItems = [
    {
      "image": "assets/images/food.webp",
      "title": "Burger On Plate",
      "description": "Make this grilling season...",
    },
    {
      "image": "assets/images/food1.webp",
      "title": "Pizza Delight",
      "description": "Cheesy and delicious...",
    },
    {
      "image": "assets/images/food2.webp",
      "title": "Pasta Special",
      "description": "Creamy and full of flavor...",
    },
  ];

  // Dynamically generate favorite status list based on foodItems length
  late List<bool> favoriteStatus;

  @override
  void initState() {
    super.initState();
    favoriteStatus = List.generate(foodItems.length, (index) => false);
  }

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
                  "Product Ordered",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Foods()),
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

          /// 🛠 Wrap in SizedBox to prevent overflow
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                foodItems.length,
                (index) => _buildFoodCard(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodCard(int index) {
    final food = foodItems[index];

    return GestureDetector(
      onTap: () {},
      // () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder:
      //         (context) => FoodsDetails(
      //           image: food["image"],
      //           name: food["title"],
      //           description: food["description"],
      //         ),
      //   ),
      // ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 200,
            height: 230,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          food["image"],
                          height: 120,
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
                                favoriteStatus[index]
                                    ? Colors.red
                                    : Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Title
                  Text(
                    food["title"],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),

                  // Description
                  Text(
                    food["description"],
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),

                  // Rating and Price Row
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Icon(Icons.star, color: Colors.orange, size: 18),
                  //         SizedBox(width: 5),
                  //         Text(
                  //           "${food["rating"]}",
                  //           style: TextStyle(fontSize: 14),
                  //         ),
                  //       ],
                  //     ),
                  //     Text(
                  //       "Rs. ${food["price"]}",
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
