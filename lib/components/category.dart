import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/category_details.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Category",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20), // Add spacing before the images
        Container(
          height: 120, // Increased height to prevent overflow
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 20), // Padding on the left
                _buildImageWithText(
                  context,
                  'assets/images/food.webp',
                  'Burger',
                ),
                SizedBox(width: 20),
                _buildImageWithText(
                  context,
                  'assets/images/food1.webp',
                  'Pizza',
                ),
                SizedBox(width: 20),
                _buildImageWithText(
                  context,
                  'assets/images/food2.webp',
                  'Pasta',
                ),
                SizedBox(width: 20),
                _buildImageWithText(
                  context,
                  'assets/images/food3.webp',
                  'Beer',
                ),
                SizedBox(width: 20),
                _buildImageWithText(
                  context,
                  'assets/images/food4.webp',
                  'Chicken',
                ),
                SizedBox(width: 20),
                _buildImageWithText(
                  context,
                  'assets/images/food5.webp',
                  'Desert',
                ),
                SizedBox(width: 20), // Padding on the right
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Widget to build an image with text below and navigate to CategoryDetails
  Widget _buildImageWithText(
    BuildContext context,
    String imagePath,
    String label,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetails(categoryName: label),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 217, 214, 214),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
