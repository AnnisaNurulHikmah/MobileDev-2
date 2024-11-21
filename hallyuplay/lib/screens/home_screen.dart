import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HallyuPlay'),
        centerTitle: true,
        backgroundColor: Color(0xFF9B59B6),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/sample_banner.jpg'), // Tambahkan gambar Anda di folder assets
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Trending Now',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Grid View for Trending (with ListView)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trendingItems.length,
                itemBuilder: (context, index) {
                  final item = trendingItems[index];
                  return buildGridItem(item['title']!, item['imagePath']!);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Hot K-Drama',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Grid View for K-Drama (with ListView)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: kDramaItems.length,
                itemBuilder: (context, index) {
                  final item = kDramaItems[index];
                  return buildGridItem(item['title']!, item['imagePath']!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build grid item with Image and Text
  Widget buildGridItem(String title, String imagePath) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy Data
final List<Map<String, String>> trendingItems = [
  {'title': 'EXHUMA', 'imagePath': 'assets/movie1.jpg'},
  {'title': 'The Moon', 'imagePath': 'assets/movie2.jpg'},
  {'title': 'The Call', 'imagePath': 'assets/movie3.jpg'},
];

final List<Map<String, String>> kDramaItems = [
  {'title': 'Family by Choice', 'imagePath': 'assets/kdrama1.jpg'},
  {'title': 'Fragile', 'imagePath': 'assets/kdrama2.jpg'},
  {'title': 'Start Up', 'imagePath': 'assets/kdrama3.jpg'},
];
