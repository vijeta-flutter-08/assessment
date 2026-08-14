
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  static const items = [
    (
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: 'Home',
    ),
    (
      icon: Icons.calendar_today_outlined,
      activeIcon: Icons.calendar_today_rounded,
      label: 'Date Now',
    ),
    (
      icon: Icons.favorite_border_rounded,
      activeIcon: Icons.favorite_rounded,
      label: 'Admirers',
    ),
    (
      icon: Icons.chat_bubble_outline_rounded,
      activeIcon: Icons.chat_bubble_rounded,
      label: 'Chat',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE9E3DE),
          ),
        ),
      ),
      child: Row(
        children: List.generate(
          items.length,
          (index) {
            final item = items[index];
            final selected = selectedIndex == index;

            return Expanded(
              child: GestureDetector(
                onTap: () => onChanged(index),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      selected
                          ? item.activeIcon
                          : item.icon,
                      size: 22,
                      color: selected
                          ? const Color(0xFFB74D72)
                          : const Color(0xFF222222),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: selected
                            ? const Color(0xFFB74D72)
                            : const Color(0xFF222222),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}