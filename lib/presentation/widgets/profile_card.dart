import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';

class ProfileCard extends StatelessWidget {
  final UserModel user;
  final int stackIndex;

  const ProfileCard({
    super.key,
    required this.user,
    this.stackIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF29292D),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.14),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: user.largeImage,
            fit: BoxFit.cover,
            placeholder: (_, __) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
            errorWidget: (_, __, ___) {
              return const Center(
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              );
            },
          ),

          // Bottom gradient
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(.12),
                    Colors.black.withOpacity(.82),
                  ],
                  stops: const [
                    0,
                    .45,
                    .67,
                    1,
                  ],
                ),
              ),
            ),
          ),

          // Refresh button
          Positioned(
            left: 12,
            top: 12,
            child: _CircleButton(
              icon: Icons.refresh_rounded,
              onTap: () {},
            ),
          ),

          // More button
          Positioned(
            right: 12,
            top: 12,
            child: _CircleButton(
              icon: Icons.more_vert_rounded,
              onTap: () {},
            ),
          ),

          // Profile information
          Positioned(
            left: 16,
            right: 16,
            bottom: 18,
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
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        user.firstName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      '${user.age}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        user.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.badge_outlined,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${_professionFor(user)} • ${_heightFor(user)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      user.relationshipStatus ?? 'Serious relationship',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Rose button
          Positioned(
            right: 0,
            bottom: 18,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.favorite_rounded,
                  color: Color(0xFFB74D72),
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _professionFor(UserModel user) {
    final professions = [
      'Product Designer',
      'Marketing Manager',
      'Software Engineer',
      'Architect',
      'Entrepreneur',
      'Consultant',
    ];

    return professions[user.firstName.codeUnitAt(0) % professions.length];
  }

  String _heightFor(UserModel user) {
    final heights = [
      '5\'4"',
      '5\'5"',
      '5\'6"',
      '5\'7"',
      '5\'8"',
      '5\'10"',
    ];

    return heights[user.firstName.codeUnitAt(0) % heights.length];
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
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 42,
          height: 42,
          child: Icon(
            icon,
            color: Colors.black87,
            size: 20,
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
        color: Colors.white.withOpacity(.35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 11,
            color: iconColor,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
