import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomNavBar({required this.currentIndex, required this.onTap});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
              color: widget.currentIndex == 0 ? Colors.purple : Colors.grey),
          label: '',
          backgroundColor: widget.currentIndex == 0
              ? Colors.purple.withOpacity(0.2)
              : Colors.transparent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline,
              color: widget.currentIndex == 1 ? Colors.purple : Colors.grey),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps,
              color: widget.currentIndex == 2 ? Colors.purple : Colors.grey),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined,
              color: widget.currentIndex == 3 ? Colors.purple : Colors.grey),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline,
              color: widget.currentIndex == 4 ? Colors.purple : Colors.grey),
          label: '',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 8.0,
    );
  }
}
