import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';

class BasicsCard extends StatelessWidget {
  final UserModel user;

  const BasicsCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'THE BASICS',
            style: TextStyle(
              color: Color(0xFFB65B75),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.04),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                _BasicRow(
                  icon: Icons.cake_outlined,
                  title: 'Age',
                  value: '${user.age} years old',
                  subtitle: _birthYear(user.age),
                ),
                _Divider(),
                _BasicRow(
                  icon: Icons.straighten_rounded,
                  title: 'Height',
                  value: _height(user),
                  subtitle: _heightCm(user),
                ),
                _Divider(),
                _BasicRow(
                  icon: Icons.location_on_outlined,
                  title: 'Lives in',
                  value: user.city,
                  subtitle: user.state,
                ),
                _Divider(),
                const _BasicRow(
                  icon: Icons.favorite_border_rounded,
                  title: 'Love language',
                  value: 'Compliment',
                  subtitle: 'Words of affirmation',
                ),
                _Divider(),
                const _BasicRow(
                  icon: Icons.local_florist_outlined,
                  title: 'Religion',
                  value: 'Hindu-Marathi',
                  subtitle: '',
                ),
                _Divider(),
                const _BasicRow(
                  icon: Icons.edit_location_sharp,
                  title: 'Interested in',
                  value: 'Women-Dating',
                  subtitle: '',
                ),
                _Divider(),
                const _BasicRow(
                  icon: Icons.sunny,
                  title: 'Zodiac',
                  value: 'Scorpio',
                  subtitle: 'Loyal-Passionate-Intutive',
                ),
                _Divider(),
                const _BasicRow(
                  icon: Icons.language,
                  title: 'Mother tongue',
                  value: 'Marathi',
                  subtitle: '',
                ),
                _Divider(),
                const _BasicRow(
                  icon: Icons.call,
                  title: 'Communication style',
                  value: 'Phone calls over texts',
                  subtitle: '',
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _birthYear(int age) {
    final year = DateTime.now().year - age;
    return '19 Feb $year';
  }

  String _height(UserModel user) {
    final heights = [
      '5\'5"',
      '5\'6"',
      '5\'7"',
      '5\'8"',
      '5\'10"',
    ];

    return heights[user.firstName.codeUnitAt(0) % heights.length];
  }

  String _heightCm(UserModel user) {
    final values = [
      '165 cm',
      '168 cm',
      '170 cm',
      '173 cm',
      '178 cm',
    ];

    return values[user.firstName.codeUnitAt(0) % values.length];
  }
}

class _BasicRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;

  const _BasicRow({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFFB65B75),
            size: 19,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF777777),
                fontSize: 12,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF282828),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (subtitle.isNotEmpty) const SizedBox(height: 2),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 10,
                  ),
                ),
            ],
          ),
        ],
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
