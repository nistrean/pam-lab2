import 'package:flutter/material.dart';

class MedicalCenterCard extends StatelessWidget {
  final String image;
  final String name;
  final String address;
  final double rating;
  final int reviews;
  final String distance;
  final String type;

  const MedicalCenterCard({
    super.key,
    required this.image,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: const Color.fromRGBO(175, 184, 186, 1),
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () {
                    print('Added to favorites!');
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(28, 42, 59, 1),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          address,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(157, 164, 176, 1),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 16),
            const SizedBox(width: 4),
            Text('$rating ($reviews Reviews)'),
          ],
        ),
        const SizedBox(height: 4),
        Text('$distance • $type'),
      ],
    );
  }
}
