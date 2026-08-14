import 'package:flutter/material.dart';

class ComplementScreen extends StatefulWidget {
  const ComplementScreen({super.key});

  @override
  State<ComplementScreen> createState() => _ComplementScreenState();
}

class _ComplementScreenState extends State<ComplementScreen> {
  int selectedCategory = 2;

  final categories = [
    'Sweet',
    'Playful',
    'Admiring',
    'Flirty',
    'First impression',
  ];

  final compliments = [
    'I really admire how driven you seem about your work.',
    'Your ambition is honestly inspiring.',
    'It’s rare to see someone so genuine in how they present themselves.',
    'You clearly have a great eye for the things you love.',
    'The way you talk about your passions is really attractive.',
    'I respect someone who knows exactly what they want.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F3),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _categories(),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
                itemCount: compliments.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: 13),
                itemBuilder: (_, index) {
                  return _complimentCard(
                    compliments[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFBE7F3),
            Color(0xFFEFF0FF),
          ],
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),

          Container(
            width: 82,
            height: 70,
            alignment: Alignment.center,
            child: const Icon(
              Icons.chat_bubble_outline_rounded,
              size: 66,
              color: Color(0xFF252525),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Compliment Ideas',
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.w800,
              color: Color(0xFF171717),
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'pick one to make a great first impression',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF777477),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories() {
    return SizedBox(
      height: 65,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 9),
        itemBuilder: (_, index) {
          final selected = selectedCategory == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFFE45177)
                    : const Color(0xFFF5F1EA),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : const Color(0xFF3B3938),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _complimentCard(String text) {
    return GestureDetector(
      onTap: () {
        // Connect this to your existing compliment flow.
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFEAE7E3),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.035),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF292727),
            fontSize: 16,
            height: 1.45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}