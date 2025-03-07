import 'package:flutter/material.dart';

class ScrollableImage extends StatefulWidget {
  const ScrollableImage({super.key});

  @override
  _ScrollableImageState createState() => _ScrollableImageState();
}

class _ScrollableImageState extends State<ScrollableImage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    "assets/images/cons.webp",
    "assets/images/cons.webp",
    "assets/images/cons.webp", // Add more images if needed
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200, // Fixed height for images
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  images[index],
                  width: 200,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10), // Space between image and indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: _currentPage == index ? 12 : 8,
              height: _currentPage == index ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.green : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
