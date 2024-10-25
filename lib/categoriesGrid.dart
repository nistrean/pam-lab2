import 'package:flutter/material.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'name': 'Dentistry', 'icon': 'assets/dentistry.png'},
      {'name': 'Cardiology', 'icon': 'assets/cardiology.png'},
      {'name': 'Pulmonology', 'icon': 'assets/pulmon.png'},
      {'name': 'General', 'icon': 'assets/general.png'},
      {'name': 'Neurology', 'icon': 'assets/neurology.png'},
      {'name': 'Gastroenterology', 'icon': 'assets/gastroen.png'},
      {'name': 'Laboratory', 'icon': 'assets/laboratory.png'},
      {'name': 'Vaccination', 'icon': 'assets/vaccinat.png'},
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 18,
        childAspectRatio: 1,
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final category = categories[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(category['icon']!, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              category['name']!,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1C2A3B),
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    );
  }
}
