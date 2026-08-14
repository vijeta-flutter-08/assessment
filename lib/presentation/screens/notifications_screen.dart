import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int selectedFilter = 0;

  final List<String> filters = [
    'All',
    'Likes & roses',
    'Matches',
    'Gifts',
    'Dates',
  ];

  final List<_NotificationItem> notifications = [
    _NotificationItem(
      name: 'Dev, 27',
      title: 'sent you a Rose',
      message: 'Your trekking photos sold me — let’s swap trail stories.',
      time: '12 min ago',
      image: 'https://i.pravatar.cc/150?img=12',
      type: _NotificationType.rose,
      buttonText: 'View profile',
      unread: true,
    ),
    _NotificationItem(
      name: 'Arjun, 28',
      title: 'complimented your About',
      message: 'Equally driven and equally curious — that line got me.',
      time: '3 h ago',
      image: 'https://i.pravatar.cc/150?img=11',
      type: _NotificationType.compliment,
      unread: false,
    ),
    _NotificationItem(
      name: 'It’s a match with Aanya, 25',
      title: '',
      message: 'You both liked each other. Say hello before the spark fades.',
      time: '40 min ago',
      image: 'https://i.pravatar.cc/150?img=47',
      type: _NotificationType.match,
      buttonText: 'Send a message',
      unread: true,
    ),
    _NotificationItem(
      name: 'Elena, 23',
      title: 'sent you a message',
      message: 'Haha okay that café pick was elite. When are you free?',
      time: '1 h ago',
      image: 'https://i.pravatar.cc/150?img=45',
      type: _NotificationType.message,
      unread: true,
    ),
    _NotificationItem(
      name: 'Kabir',
      title: 'approved your date request',
      message: 'Coffee at Blue Tokai · Today, 7:00 PM · Koregaon Park',
      time: '2 h ago',
      type: _NotificationType.date,
      buttonText: 'Open chat',
      unread: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F3),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildFilters(),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
                itemCount: notifications.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  return _NotificationCard(
                    item: notifications[index],
                    onButtonTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CircleButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF191919),
                    height: 1.05,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${notifications.where((e) => e.unread).length} new updates',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF9A9997),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                for (final notification in notifications) {
                  notification.unread = false;
                }
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Mark all read',
                style: TextStyle(
                  color: Color(0xFFD95A7B),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SizedBox(
      height: 54,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final selected = selectedFilter == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFF262626) : Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: selected
                      ? const Color(0xFF262626)
                      : const Color(0xFFE9E7E3),
                ),
                boxShadow: selected
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(.035),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
              ),
              child: Row(
                children: [
                  Text(
                    filters[index],
                    style: TextStyle(
                      color: selected ? Colors.white : const Color(0xFF484747),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (index == 0) ...[
                    const SizedBox(width: 7),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? Colors.white.withOpacity(.18)
                            : const Color(0xFFECEAE7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '56',
                        style: TextStyle(
                          color:
                              selected ? Colors.white : const Color(0xFF666462),
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final _NotificationItem item;
  final VoidCallback onButtonTap;

  const _NotificationCard({
    required this.item,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 17, 16, 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFF0EEEB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.045),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Avatar(item: item),
          const SizedBox(width: 14),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(),
                      if (item.message.isNotEmpty) ...[
                        const SizedBox(height: 7),
                        Text(
                          item.message,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: Color(0xFF696765),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                      Text(
                        item.time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9D9A97),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (item.buttonText != null) ...[
                        const SizedBox(height: 13),
                        GestureDetector(
                          onTap: onButtonTap,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 11,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE65379),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Text(
                              item.buttonText!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (item.unread)
                  Positioned(
                    top: 2,
                    right: 0,
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE65379),
                        shape: BoxShape.circle,
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

  Widget _buildTitle() {
    if (item.title.isEmpty) {
      return Text(
        item.name,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF242323),
          fontWeight: FontWeight.w700,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF242323),
          height: 1.3,
        ),
        children: [
          TextSpan(
            text: item.name,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' ${item.title}',
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final _NotificationItem item;

  const _Avatar({required this.item});

  @override
  Widget build(BuildContext context) {
    if (item.type == _NotificationType.date) {
      return Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF0E5),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Icon(
          Icons.calendar_month_rounded,
          color: Color(0xFFD58A4A),
          size: 29,
        ),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipOval(
          child: Image.network(
            item.image!,
            width: 62,
            height: 62,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                width: 62,
                height: 62,
                color: const Color(0xFFEDEDED),
                child: const Icon(Icons.person),
              );
            },
          ),
        ),
        Positioned(
          right: -2,
          bottom: -1,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: _badgeColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Icon(
              _badgeIcon,
              size: 13,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Color get _badgeColor {
    switch (item.type) {
      case _NotificationType.rose:
        return const Color(0xFFE65379);
      case _NotificationType.compliment:
        return const Color(0xFFE6A52F);
      case _NotificationType.match:
        return const Color(0xFF39B97A);
      case _NotificationType.message:
        return const Color(0xFFE65379);
      case _NotificationType.date:
        return const Color(0xFFD58A4A);
    }
  }

  IconData get _badgeIcon {
    switch (item.type) {
      case _NotificationType.rose:
        return Icons.local_florist_rounded;
      case _NotificationType.compliment:
        return Icons.chat_bubble_rounded;
      case _NotificationType.match:
        return Icons.check_rounded;
      case _NotificationType.message:
        return Icons.chat_rounded;
      case _NotificationType.date:
        return Icons.calendar_month_rounded;
    }
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: const SizedBox(
          width: 48,
          height: 48,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18,
            color: Color(0xFF262626),
          ),
        ),
      ),
    );
  }
}

enum _NotificationType {
  rose,
  compliment,
  match,
  message,
  date,
}

class _NotificationItem {
  final String name;
  final String title;
  final String message;
  final String time;
  final String? image;
  final _NotificationType type;
  final String? buttonText;
  bool unread;

  _NotificationItem({
    required this.name,
    required this.title,
    required this.message,
    required this.time,
    this.image,
    required this.type,
    this.buttonText,
    required this.unread,
  });
}
