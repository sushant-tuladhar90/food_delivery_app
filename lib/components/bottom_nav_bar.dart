import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;  // Add currentIndex to hold the selected index
  final Function(int) onItemTapped;

  const BottomNavBar({super.key, required this.currentIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green, // Color for the selected item
      unselectedItemColor: Colors.black54, // Color for unselected items
      currentIndex: currentIndex,  // Dynamically set the current index
      onTap: (index) => onItemTapped(index),  // Update the index on tap
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30),
          label: "Menu",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, size: 30),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, size: 30),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, size: 30),
          label: "Account",
        ),
      ],
    );
  }
}
