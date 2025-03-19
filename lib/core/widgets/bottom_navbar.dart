import 'package:flutter/material.dart';

class BottomNavbarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final bool isVertical;

  const BottomNavbarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.production_quantity_limits),
          label: 'Products',
        ),

        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: onTap,
    );
  }
}
