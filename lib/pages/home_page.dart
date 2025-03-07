import 'package:flutter/material.dart';
import 'package:food_ordering_app/components/bottom_nav_bar.dart';
import 'package:food_ordering_app/screens/main_screen.dart';
import 'package:food_ordering_app/pages/favorite_page.dart';
import 'package:food_ordering_app/pages/cart_page.dart';
import 'package:food_ordering_app/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of Screens to navigate to based on selected index
  final List<Widget> _screens = [
    MainScreen(),
    const FavoritePage(),
    const CartPage(cartItems: []),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display selected screen
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex, // Pass the current index here
        onItemTapped: _onItemTapped,  // Pass the onItemTapped function
      ),
    );
  }
}