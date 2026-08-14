import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PleasureCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String time;

  const PleasureCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        // Video Intro Thumbnail
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.40),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 260,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (_, __) {
                      return Container(
                        height: 260,
                        color: Colors.grey.shade200,
                      );
                    },
                    errorWidget: (_, __, ___) {
                      return Container(
                        height: 260,
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.person),
                      );
                    },
                  ),

                  // Dark overlay
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.12),
                    ),
                  ),

                  // Center Play Button
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.92),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.20),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.black.withOpacity(0.90),
                      size: 34,
                    ),
                  ),

                  // Video duration
                  Positioned(
                    left: 0,
                    bottom: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        children: [
                          Text(
                            " Video intro",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.circle,
                            size: 2,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            time,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 42),

        // Rest of your card...
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My simple pleasures...',
                  style: TextStyle(
                    color: Color(0xFFB65B75),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _pleasure(name),
                  style: const TextStyle(
                    color: Color(0xFF252525),
                    fontSize: 15,
                    height: 1.45,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Material(
                  color: const Color(0xFFFFF7F9),
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: const SizedBox(
                      width: 34,
                      height: 34,
                      child: Center(
                        child: Text(
                          '🌹',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _pleasure(String name) {
    final pleasures = [
      'Roadside chai after a long trek, no signal, good company.',
      'A quiet coffee shop, a good playlist and nowhere to rush.',
      'Exploring a new city with someone who enjoys getting lost.',
      'Long conversations after midnight and spontaneous plans.',
    ];

    return pleasures[name.codeUnitAt(0) % pleasures.length];
  }
}
