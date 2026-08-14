import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';
import 'about_section.dart';
import 'basics_card.dart';
import 'interests_section.dart';
import 'pleasure_card.dart';
import 'profile_card.dart';

class ProfileStack extends StatefulWidget {
  final List<UserModel> users;

  const ProfileStack({
    super.key,
    required this.users,
  });

  @override
  State<ProfileStack> createState() => _ProfileStackState();
}

class _ProfileStackState extends State<ProfileStack>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  double dragX = 0;

  double targetX = 0;

  bool isAnimating = false;

  late final AnimationController _swipeController;

  @override
  void initState() {
    super.initState();
    _swipeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addStatusListener(_onSwipeStatus);
  }

  @override
  void dispose() {
    _swipeController.dispose();
    super.dispose();
  }

  void _onSwipeStatus(AnimationStatus status) {
    if (status != AnimationStatus.completed) return;

    setState(() {
      if (targetX == 0) {
        dragX = 0;
      } else {
        currentIndex++;
        dragX = 0;
        targetX = 0;
      }
      isAnimating = false;
    });

    _swipeController.value = 0;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (isAnimating) return;

    setState(() {
      dragX += details.delta.dx;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (isAnimating) return;

    const threshold = 100.0;
    final velocity = details.velocity.pixelsPerSecond.dx;

    if (dragX.abs() > threshold || velocity.abs() > 900) {
      final direction = dragX != 0 ? dragX : velocity;
      _animateTo(direction > 0 ? 1 : -1);
    } else {
      _animateBack();
    }
  }

  void _animateTo(int direction) {
    if (currentIndex >= widget.users.length - 1) {
      _animateBack();
      return;
    }

    final width = MediaQuery.sizeOf(context).width;

    setState(() {
      isAnimating = true;
      targetX = direction * (width * 1.2);
    });

    _swipeController.animateTo(
      1,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  void _animateBack() {
    setState(() {
      isAnimating = true;
      targetX = 0;
    });

    _swipeController.animateTo(
      1,
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOutBack,
    );
  }

  double get _offsetX => dragX + (targetX - dragX) * _swipeController.value;

  @override
  Widget build(BuildContext context) {
    if (widget.users.isEmpty) {
      return const SizedBox(
        height: 500,
        child: Center(
          child: Text('No profiles found'),
        ),
      );
    }

    final user = widget.users[currentIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PROFILE STACK
        SizedBox(
          height: 550,
          child: _buildProfileStack(),
        ),

        // ABOUT
        AboutSection(
          name: user.firstName,
        ),

        _Divider(),

        // BASICS
        BasicsCard(
          user: user,
        ),

        // LARGE IMAGE + PLEASURE
        PleasureCard(
          imageUrl: user.largeImage,
          name: user.firstName,
          time: '0:32',
        ),

        // INTERESTS
        InterestsSection(
          name: user.firstName,
        ),

        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildProfileStack() {
    final visibleUsers = widget.users.skip(currentIndex).take(3).toList();

    return AnimatedBuilder(
      animation: _swipeController,
      builder: (context, _) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            for (int i = visibleUsers.length - 1; i >= 0; i--)
              _buildCard(
                visibleUsers[i],
                i,
              ),
          ],
        );
      },
    );
  }

  double _cardInset(int stackIndex) {
    if (stackIndex == 0) return 0;
    if (stackIndex == 1 && targetX != 0) {
      return 20 * (1 - _swipeController.value);
    }
    return 20;
  }

  Widget _buildCard(
    UserModel user,
    int stackIndex,
  ) {
    final isTop = stackIndex == 0;
    final inset = _cardInset(stackIndex);

    if (!isTop) {
      return Positioned(
        top: 8 + (stackIndex * 8),
        left: inset,
        right: inset,
        bottom: 4,
        child: ProfileCard(
          user: user,
          stackIndex: stackIndex,
        ),
      );
    }

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 4,
      child: GestureDetector(
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: Transform.translate(
          offset: Offset(_offsetX, 0),
          child: Transform.rotate(
            angle: _offsetX * 0.0008,
            child: ProfileCard(
              user: user,
              stackIndex: stackIndex,
            ),
          ),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Divider(
        height: 1,
        thickness: .6,
        color: Color(0xFFE9E4DF),
      ),
    );
  }
}
