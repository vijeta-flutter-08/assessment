import 'package:flutter/material.dart';

class DateNowScreen extends StatefulWidget {
  const DateNowScreen({super.key});

  @override
  State<DateNowScreen> createState() => _DateNowScreenState();
}

class _DateNowScreenState extends State<DateNowScreen> {
  int selectedTab = 0;

  final tabs = ['Today', 'Tomorrow', 'Weekend'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F4),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _tabs(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                child: _dateCard(),
              ),
            ),
            _bottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 16, 12),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Date ',
                  style: TextStyle(
                    color: Color(0xFF171717),
                    fontSize: 31,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: 'Now',
                  style: TextStyle(
                    color: Color(0xFFE45177),
                    fontSize: 31,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            decoration: BoxDecoration(
              color: const Color(0xFFE45177),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                  size: 19,
                ),
                SizedBox(width: 9),
                Text(
                  'My Plans',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Color(0xFFE45177),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabs() {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          final selected = selectedTab == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = index;
              });
            },
            child: Container(
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFFFF3F6) : Colors.white,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(
                  color: selected
                      ? const Color(0xFFE45177)
                      : const Color(0xFFE9E6E3),
                  width: selected ? 2 : 1,
                ),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: selected
                      ? const Color(0xFFD74E72)
                      : const Color(0xFF282727),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _dateCard() {
    return Container(
      height: 620,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: const Color(0xFF17131C),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?auto=format&fit=crop&w=900&q=85',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.12),
                    Colors.transparent,
                    Colors.black.withOpacity(.9),
                  ],
                  stops: const [0, .45, 1],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: _darkPill(
              icon: Icons.circle,
              text: 'Live · Olive Bar, Mahalaxmi',
              color: const Color(0xFF35C985),
            ),
          ),
          Positioned(
            top: 70,
            left: 20,
            child: _darkPill(
              icon: Icons.location_on,
              text: '3.4 km away',
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _infoPill(
                      Icons.calendar_today,
                      'TODAY',
                      pink: true,
                    ),
                    const SizedBox(width: 8),
                    _infoPill(
                      Icons.access_time,
                      '8:30 PM',
                    ),
                    const SizedBox(width: 8),
                    _infoPill(
                      Icons.restaurant,
                      'Dinner',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Pasta & Honest Chats',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Foodie looking for a dinner buddy 🍝',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    _smallTag('💜 88% match'),
                    const SizedBox(width: 7),
                    _smallTag('👥 Just 1'),
                    const SizedBox(width: 7),
                    _smallTag('🤝 I’ll pay'),
                  ],
                ),
                const SizedBox(height: 17),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.12),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(.16),
                    ),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?img=47',
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ananya, 25 ✓',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'she/her · Foodie',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Profile →',
                        style: TextStyle(
                          color: Color(0xFFFFB5C7),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _darkPill({
    required IconData icon,
    required String text,
    Color? color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: color ?? Colors.black.withOpacity(.65),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 13),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoPill(
    IconData icon,
    String text, {
    bool pink = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: pink ? const Color(0xFFE45177) : Colors.white.withOpacity(.18),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 14,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _bottomActions() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
      color: const Color(0xFFF9F8F4),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.close),
              label: const Text('Skip'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFD75C70),
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: Color(0xFFE9E5E2),
                ),
                minimumSize: const Size(0, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month),
              label: const Text('Request Date'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE45177),
                foregroundColor: Colors.white,
                minimumSize: const Size(0, 58),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
