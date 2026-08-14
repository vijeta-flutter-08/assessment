import 'package:flutter/material.dart';

class InterestsSection extends StatelessWidget {
  final String name;

  const InterestsSection({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final interests = [
      (Icons.flight_takeoff_rounded, 'Travel'),
      (Icons.coffee_rounded, 'Coffee'),
      (Icons.terrain_rounded, 'Trekking'),
      (Icons.menu_book_rounded, 'Books'),
      (Icons.self_improvement_rounded, 'Yoga'),
      (Icons.music_note_rounded, 'Indie music'),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'INTERESTS & HOBBIES',
            style: TextStyle(
              color: Color(0xFFB65B75),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: interests.map(
              (interest) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: const Color(0xFFF0E9E5),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        interest.$1,
                        size: 15,
                        color: const Color(0xFFB65B75),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        interest.$2,
                        style: const TextStyle(
                          color: Color(0xFF3B3B3B),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
