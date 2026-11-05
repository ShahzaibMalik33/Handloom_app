import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'categories_screen.dart';
import 'handloom_dedsheets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future fetchProducts() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      {
        'id': '1',
        'title': 'Jaipur Blue Floral Handloom Bedsheet',
        'category': 'Bedsheets',
        'price': 1899,
        'rating': 4.8,
        'reviewsCount': 124,
        'imageUrl': 'https://images.unsplash.com/photo-1616594039964-ae9021a400a0?q=80&w=1000&auto=format&fit=crop',
      },
      {
        'id': '2',
        'title': 'Meghdoot Handblock Comforter',
        'category': 'Comforters',
        'price': 3499,
        'rating': 4.7,
        'reviewsCount': 96,
        'imageUrl': 'https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?q=80&w=1000&auto=format&fit=crop',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          children: [
            const Icon(Icons.local_florist, color: Color(0xFF0066B2), size: 28),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HANDLOOM HAVEN',
                  style: GoogleFonts.merriweather(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                Text(
                  'INDIAN HANDLOOMS FOR A BRIGHTER HOME',
                  style: GoogleFonts.inter(fontSize: 7, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF1E293B)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.grid_view, color: Color(0xFF0066B2)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoriesScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  const Icon(Icons.location_pin, color: Color(0xFF0066B2), size: 18),
                  const SizedBox(width: 6),
                  Text(
                    'Deliver to 560001, Bengaluru',
                    style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500, color: const Color(0xFF1E293B)),
                  ),
                  const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey),
                ],
              ),
            ),
            Container(
              height: 220,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1616594039964-ae9021a400a0?q=80&w=1000&auto=format&fit=crop'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('NATURAL THREADS\nBRIGHTER TOMORROWS', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54)),
                    const SizedBox(height: 6),
                    Text('Weaving comfort\nnaturally', style: GoogleFonts.merriweather(fontSize: 26, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A), height: 1.1)),
                    const SizedBox(height: 6),
                    Text('Premium handloom bedding\nfor calmer, kinder homes.', style: GoogleFonts.inter(fontSize: 11, color: Colors.black87)),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BedsheetsScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0066B2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Shop Now', style: TextStyle(color: Colors.white, fontSize: 12)),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward, size: 14, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildCategoryItem(context, 'Bedsheets', 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=200'),
                  _buildCategoryItem(context, 'Comforters', 'https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?w=200'),
                  _buildCategoryItem(context, 'Dohars', 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=200'),
                  _buildCategoryItem(context, 'Cushions', 'https://images.unsplash.com/photo-1579656381226-5fc0f0100c3b?w=200'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New Arrivals', style: GoogleFonts.merriweather(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CategoriesScreen()),
                      );
                    },
                    child: Row(
                      children: const [
                        Text('View All', style: TextStyle(color: Color(0xFF0066B2), fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_forward, size: 14, color: Color(0xFF0066B2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 290,
              child: FutureBuilder(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                    return const Center(child: Text('No products available'));
                  }
                  final products = snapshot.data as List;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemBuilder: (context, index) {
                      return _buildProductCard(context, products[index]);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BedsheetsScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            CircleAvatar(radius: 35, backgroundImage: NetworkImage(imageUrl)),
            const SizedBox(height: 6),
            Text(title, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xFF1E293B))),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, dynamic product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BedsheetsScreen()),
        );
      },
      child: Container(
        width: 175,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(product['imageUrl'], height: 130, width: double.infinity, fit: BoxFit.cover),
                ),
                const Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_border, size: 16, color: Colors.black54),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['title'], maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 12, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text('${product['rating']} (${product['reviewsCount']})', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('₹${product['price']}', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
                      Container(
                        decoration: BoxDecoration(color: const Color(0xFF0066B2), borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white, size: 16),
                          constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const BedsheetsScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}