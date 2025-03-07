import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/cart_page.dart';
import 'package:food_ordering_app/pages/favorite_page.dart';
import 'package:food_ordering_app/pages/profile.dart';
import 'package:food_ordering_app/screens/main_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // List of Icons for Bottom Navigation Items
  final List<IconData> _icons = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.account_circle,
  ];

  // List of Labels for Bottom Navigation Items
  final List<String> _labels = ["Menu", "Favorite", "Cart", "Account"];

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
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure all items are shown
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: List.generate(_icons.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(_icons[index], size: 30),
            label: _labels[index],
          );
        }),
      ),
    );
  }
}
