import 'package:flutter/material.dart';
import 'package:food_ordering_app/components/bottom_nav_bar.dart';
import 'package:food_ordering_app/components/category.dart';
import 'package:food_ordering_app/components/recommended_for_you.dart';
import 'package:food_ordering_app/components/restaurant_near_you.dart';
import 'package:food_ordering_app/components/scrollable_image.dart';
import 'package:food_ordering_app/components/search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person, size: 40),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sushant Tuladhar",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Text(
                                      "Choose your favorite...",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.notifications),
                            ],
                          ),
                        ),
                        Search(),
                        SizedBox(height: 10),
                        ScrollableImage(),
                        SizedBox(height: 10),
                        Category(),
                        SizedBox(height: 5),
                        RecommendedForYou(),
                        SizedBox(height: 5),
                        RestaurantNearYou(),
                        SizedBox(height: 80), // Space for bottom nav bar
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Fixed Bottom Navigation Bar
            Positioned(left: 0, right: 0, bottom: 0, child: BottomNavBar()),
          ],
        ),
      ),
    );
  }
}
