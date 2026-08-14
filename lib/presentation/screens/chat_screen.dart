import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F4),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _progress(),
            _tabs(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  12,
                  16,
                  15,
                ),
                children: [
                  _dateCard(),
                  const SizedBox(height: 20),
                  _today(),
                  const SizedBox(height: 12),
                  _message(),
                  const SizedBox(height: 18),
                  _gift(),
                ],
              ),
            ),
            _composer(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 10),
      child: Row(
        children: [
          _roundIcon(
            Icons.arrow_back_ios_new,
            () => Navigator.pop(context),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=47',
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Aanya',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 8),
                    _PlatinumBadge(),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: Color(0xFF38BE78),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: Color(0xFF38BE78),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _roundIcon(Icons.call_outlined, () {}),
          const SizedBox(width: 7),
          _roundIcon(Icons.videocam_outlined, () {}),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }

  Widget _progress() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 5, 18, 12),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'RELATIONSHIP PROGRESS',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 2,
                  color: Color(0xFF8A8885),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              const Text(
                'LEVEL 5',
                style: TextStyle(
                  color: Color(0xFFE45177),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
              value: .72,
              minHeight: 7,
              backgroundColor: Color(0xFFEDE9E6),
              valueColor: AlwaysStoppedAnimation(
                Color(0xFFE45177),
              ),
            ),
          ),
          const SizedBox(height: 9),
          const Row(
            children: [
              Icon(
                Icons.emoji_events_outlined,
                size: 17,
                color: Color(0xFFD8A62C),
              ),
              SizedBox(width: 5),
              Text(
                'Milestone reached: ',
                style: TextStyle(
                  color: Color(0xFF777472),
                ),
              ),
              Text(
                'Premium Badge unlocked',
                style: TextStyle(
                  color: Color(0xFFE45177),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tabs() {
    return SizedBox(
      height: 56,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        scrollDirection: Axis.horizontal,
        children: [
          _tab('🎁 Gifts', '12', true),
          const SizedBox(width: 10),
          _tab('💬 Compliments', null, false),
          const SizedBox(width: 10),
          _tab('📅 Date Invites', null, false),
        ],
      ),
    );
  }

  Widget _tab(String title, String? count, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFE45177) : Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: selected ? const Color(0xFFE45177) : const Color(0xFFE6E2DE),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF262424),
              fontWeight: FontWeight.w700,
            ),
          ),
          if (count != null) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 11,
              backgroundColor: Colors.white.withOpacity(.25),
              child: Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _dateCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 17, 18, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFF0C9D5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🛡 Meet at the venue · your exact location stays private.\n'
            'Have a great date!',
            style: TextStyle(
              color: Color(0xFF6D6A68),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 105,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFE8E3DF),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Color(0xFFE45177),
                  size: 42,
                ),
                SizedBox(height: 5),
                Text(
                  '📍 Blue Tokai',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: _dateButton(
                  'Add to calendar',
                  true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _dateButton(
                  'Get directions',
                  false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dateButton(String text, bool filled) {
    return Container(
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: filled ? const Color(0xFFE45177) : Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: filled ? const Color(0xFFE45177) : const Color(0xFFE7E2DF),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: filled ? Colors.white : const Color(0xFF343231),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _today() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'TODAY',
            style: TextStyle(
              color: Color(0xFF7D7977),
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "You reacted to Aanya's About",
          style: TextStyle(
            color: Color(0xFF8C8986),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _message() {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                18,
                15,
                15,
                12,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFE45177),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                  bottomLeft: Radius.circular(22),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "If you're as fun in person as your\n"
                    "profile, I'm in.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '1:04 PM ✓✓',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 7),
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=12',
            ),
          ),
        ],
      ),
    );
  }

  Widget _gift() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFECE8E4),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '🌹',
                style: TextStyle(fontSize: 35),
              ),
              SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rose',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '🪙 10 coins',
                    style: TextStyle(
                      color: Color(0xFFD4A62D),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Spacer(),
              _SentBadge(),
            ],
          ),
          SizedBox(height: 14),
          Text(
            '“A little something to brighten your day 🌹”',
            style: TextStyle(
              color: Color(0xFF777371),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _composer() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: const BoxDecoration(
        color: Color(0xFFF9F8F4),
      ),
      child: Row(
        children: [
          _composerButton(Icons.add),
          const SizedBox(width: 8),
          _composerButton(Icons.image_outlined),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(27),
                border: Border.all(
                  color: const Color(0xFFE6E1DE),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Message Aanya...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.mic_none,
                    color: Color(0xFF8D8986),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 54,
            height: 54,
            decoration: const BoxDecoration(
              color: Color(0xFFE45177),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.send_rounded,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _composerButton(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: const Color(0xFF4D4947),
      ),
    );
  }

  Widget _roundIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: const Color(0xFFE45177),
          size: 21,
        ),
      ),
    );
  }
}

class _PlatinumBadge extends StatelessWidget {
  const _PlatinumBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF26231C),
        borderRadius: BorderRadius.circular(7),
      ),
      child: const Text(
        'PLATINUM',
        style: TextStyle(
          color: Color(0xFFF0D76A),
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: .7,
        ),
      ),
    );
  }
}

class _SentBadge extends StatelessWidget {
  const _SentBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0F4),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Text(
        'SENT',
        style: TextStyle(
          color: Color(0xFFD95373),
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
