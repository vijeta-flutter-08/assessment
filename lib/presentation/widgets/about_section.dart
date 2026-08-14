import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final String name;

  const AboutSection({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _InfoPill(
                icon: Icons.circle,
                text: '74% Match',
                iconColor: const Color.fromARGB(255, 88, 196, 221),
              ),
              const SizedBox(width: 7),
              _InfoPill(
                icon: Icons.circle,
                text: '98% Trust',
                iconColor: const Color(0xFF67D4B0),
              ),
              const SizedBox(width: 7),
              _InfoPill(
                icon: Icons.circle,
                text: '~5m Reply',
                iconColor: const Color(0xFFFFD166),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'ABOUT',
            style: TextStyle(
              color: Color(0xFFB65B75),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _aboutText(name),
            style: const TextStyle(
              color: Color(0xFF272727),
              fontSize: 14,
              height: 1.65,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: _RoseButton(
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  String _aboutText(String name) {
    final texts = [
      'Building products by day, planning my next trek by night. Looking for someone equally driven and equally curious.',
      'I enjoy discovering new places, good conversations and making time for the little things that matter.',
      'Always curious, always learning. Looking for someone who enjoys meaningful conversations and spontaneous adventures.',
      'Work keeps me busy, but I always make time for travel, coffee and people who make me laugh.',
    ];

    return texts[name.codeUnitAt(0) % texts.length];
  }
}

class _RoseButton extends StatelessWidget {
  final VoidCallback onTap;

  const _RoseButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red[50],
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 38,
          height: 38,
          child: Center(
            child: Text(
              '🌹',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const _InfoPill({
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 4),
          Icon(
            icon,
            size: 11,
            color: iconColor,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
