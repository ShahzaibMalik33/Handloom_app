import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'handloom_dedsheets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  Future fetchCategories() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      {'id': '1', 'title': 'Bedsheets', 'imageUrl': 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=500'},
      {'id': '2', 'title': 'Comforters', 'imageUrl': 'https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?w=500'},
      {'id': '3', 'title': 'Comforter Sets', 'imageUrl': 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=500'},
      {'id': '4', 'title': 'Dohars', 'imageUrl': 'https://images.unsplash.com/photo-1579656381226-5fc0f0100c3b?w=500'},
      {'id': '5', 'title': 'Quilts', 'imageUrl': 'https://images.unsplash.com/photo-1616594039964-ae9021a400a0?w=500'},
      {'id': '6', 'title': 'Cushion Covers', 'imageUrl': 'https://images.unsplash.com/photo-1582582494705-f829b3147879?w=500'},
      {'id': '7', 'title': 'Curtains', 'imageUrl': 'https://images.unsplash.com/photo-1513519245088-0e12902e5a38?w=500'},
      {'id': '8', 'title': 'Table Linen', 'imageUrl': 'https://images.unsplash.com/photo-1615874959474-d6099696fc52?w=500'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.local_florist, color: Color(0xFF0066B2), size: 24),
            const SizedBox(width: 8),
            Text(
              'HANDLOOM HAVEN',
              style: GoogleFonts.merriweather(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: const Color(0xFF1E293B),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Shop by Category',
              style: GoogleFonts.merriweather(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Bring home the beauty of Indian handlooms.\nTimeless textiles for a more meaningful, beautiful home.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B), height: 1.4),
            ),
            const SizedBox(height: 12),
            const Icon(Icons.local_florist, size: 16, color: Color(0xFF0066B2)),
            const SizedBox(height: 20),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('No categories found'),
                  );
                }

                final categories = snapshot.data as List;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.82,
                    ),
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BedsheetsScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                  child: Image.network(
                                    cat['imageUrl']!,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        cat['title']!,
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF1E293B),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Icon(Icons.chevron_right, size: 18, color: Color(0xFF64748B)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}