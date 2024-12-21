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
    this.selectedItemColor = Colors.blue,
    this.unselectedItemColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(
        right: 24,
        left: 24,
        bottom: 50,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
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
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: isSelected
                  ? BoxDecoration(
                      color: selectedItemColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    )
                  : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item['icon'],
                    color: isSelected ? selectedItemColor : unselectedItemColor,
                    size: isSelected ? 30 : 24,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item['label'],
                    style: TextStyle(
                      color:
                          isSelected ? selectedItemColor : unselectedItemColor,
                      fontSize: isSelected ? 14 : 12,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: selectedItemColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
