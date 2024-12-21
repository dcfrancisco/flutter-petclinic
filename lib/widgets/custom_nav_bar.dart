import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<Map<String, dynamic>> navItems;
  final Color selectedItemColor;
  final Color unselectedItemColor;

  const CustomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.navItems,
    this.selectedItemColor = Colors.blue, // Default selected color
    this.unselectedItemColor = Colors.grey, // Default unselected color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.only(
        right: 24,
        left: 24,
        bottom: 50,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 45, 21, 13),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navItems.map((item) {
          final int index = navItems.indexOf(item);
          final bool isSelected = currentIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item['icon'],
                  color: isSelected ? selectedItemColor : unselectedItemColor,
                  size: 24, // Consistent icon size
                ),
                const SizedBox(height: 4),
                Text(
                  item['label'],
                  style: TextStyle(
                    color: isSelected ? selectedItemColor : unselectedItemColor,
                    fontSize: 10, // Smaller font size like BottomNavigationBar
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
