import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Reviews"),
        // backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildReview(
              "John Doe",
              "2025-03-08",
              4.5,
              "The food was delicious and well prepared!",
            ),
            _buildReview(
              "Alice Smith",
              "2025-03-07",
              5.0,
              "Amazing taste, great presentation! Will order again.",
            ),
            _buildReview(
              "Michael Brown",
              "2025-03-06",
              4.0,
              "Good portion size, but could be a bit spicier.",
            ),
            _buildReview(
              "Sophia Johnson",
              "2025-03-05",
              5.0,
              "Absolutely loved it! Would highly recommend.",
            ),
            _buildReview(
              "David Wilson",
              "2025-03-04",
              3.5,
              "Food was good, but the delivery was a bit late.",
            ),
            _buildReview(
              "Emily Davis",
              "2025-03-03",
              4.8,
              "Fresh ingredients and amazing flavors!",
            ),
            _buildReview(
              "Daniel Martinez",
              "2025-03-02",
              4.2,
              "A great experience! Would order again.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReview(String name, String date, double rating, String comment) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name and Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  SizedBox(width: 4),
                  Text(
                    "$rating",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(date, style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(height: 8),
          Text(comment, style: TextStyle(fontSize: 16, color: Colors.black87)),
        ],
      ),
    );
  }
}
