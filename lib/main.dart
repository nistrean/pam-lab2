import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'medicalCenters.dart';
import 'categoriesGrid.dart';
import 'doctorCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DoctorAppointment(),
    );
  }
}

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({super.key});

  @override
  DoctorAppointmentState createState() => DoctorAppointmentState();
}

class DoctorAppointmentState extends State<DoctorAppointment> {
  final PageController _pageController = PageController();

  final List<String> images = [
    'assets/img1.png',
    'assets/image1.webp',
    'assets/image2.webp',
  ];

  final List<Map<String, dynamic>> medicalCenters = [
    {
      'image': 'assets/medical-center.png',
      'name': 'Sunrise Health Clinic',
      'address': '123 Oak Street, CA 98765',
      'rating': 5.0,
      'reviews': 58,
      'distance': '2.5 km/40min',
      'type': 'Hospital',
    },
    {
      'image': 'assets/medical-center2.png',
      'name': 'Golden Cardiology Center',
      'address': '555 Bridge Street, CA 98765',
      'rating': 4.9,
      'reviews': 42,
      'distance': '2.5 km/40min',
      'type': 'Clinic',
    },
  ];

  final List<Map<String, dynamic>> doctors = [
    {
      'image': 'assets/doctor1.png',
      'name': 'Dr. David Patel',
      'specialty': 'Cardiologist',
      'clinic': 'Cardiology Center',
      'location': 'USA',
      'rating': 5.0,
      'reviews': 1872,
    },
    {
      'image': 'assets/doctor2.png',
      'name': 'Dr. Jessica Turner',
      'specialty': 'Gynecologist',
      'clinic': 'Women`s Clinic',
      'location': 'Seattle, USA',
      'rating': 4.9,
      'reviews': 127,
    },
    {
      'image': 'assets/doctor3.png',
      'name': 'Dr. Michael Johnson',
      'specialty': 'Orthoped Surgery',
      'clinic': 'Maple Associates',
      'location': 'NY,USA',
      'rating': 4.7,
      'reviews': 5223,
    },
    {
      'image': 'assets/doctor4.png',
      'name': 'Dr. Emily Walker',
      'specialty': 'Pediatrics',
      'clinic': 'Serenity Pediatrics Clinic',
      'location': 'Seattle, USA',
      'rating': 5.0,
      'reviews': 405,
    },
    {
      'image': 'assets/doctor5.png',
      'name': 'Dr. Emily Walker',
      'specialty': 'Pediatrics',
      'clinic': 'Serenity Pediatrics Clinic',
      'location': 'Seattle, USA',
      'rating': 5.0,
      'reviews': 405,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(28, 42, 59, 1),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Color.fromRGBO(28, 42, 59, 1)),
                    SizedBox(width: 5),
                    Text(
                      'Seattle, USA',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(28, 42, 59, 1),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Color.fromRGBO(28, 42, 59, 1)),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFFF1F3F7),
                  child: Icon(Icons.notifications, color: Color.fromRGBO(28, 42, 59, 1)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(242, 243, 245, 1),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search doctor...',
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Color.fromRGBO(157, 164, 176, 1)),
              ),
            ),
          ),
          const SizedBox(height: 20.0),

          // Image Slider
          Stack(
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: images.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Colors.teal,
                      dotColor: Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),

          // Categories Title
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(28, 42, 59, 1),
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(157, 164, 176, 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Categories Grid
          const SizedBox(
            height: 220,
            child: CategoriesGrid(),
          ),

          // nearby medical centers Title
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nearby Medical Centers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(28, 42, 59, 1),
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(157, 164, 176, 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          SizedBox(
            height: 310,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: medicalCenters.length,
              itemBuilder: (context, index) {
                final medicalCenter = medicalCenters[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SizedBox(
                    width: 220,
                    child: MedicalCenterCard(
                      image: medicalCenter['image'],
                      name: medicalCenter['name'],
                      address: medicalCenter['address'],
                      rating: medicalCenter['rating'],
                      reviews: medicalCenter['reviews'],
                      distance: medicalCenter['distance'],
                      type: medicalCenter['type'],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(
            height: 740,
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return DoctorCard(
                image: doctor['image'],
                name: doctor['name'],
                specialty: doctor['specialty'],
                clinic: doctor['clinic'],
                location: doctor['location'],
                rating: doctor['rating'],
                reviews: doctor['reviews'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
