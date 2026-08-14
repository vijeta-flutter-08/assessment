import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';
import '../widgets/bottom_navigation.dart';
import 'home_screen.dart';
import 'date_now_screen.dart';
import 'admirers_screen.dart';
import 'chat_screen.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    DateNowScreen(),
    ComplementScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEE8),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: currentIndex,
        onChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
