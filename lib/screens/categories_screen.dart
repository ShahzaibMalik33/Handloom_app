
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'handloom_dedsheets.dart';
import 'filters_screen.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  // Categories List
  final List<Map<String, String>> _categories = [
    {
      'id': '1',
      'title': 'Bedsheets',
      'imageUrl':
      'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=500',
    },
    {
      'id': '2',
      'title': 'Comforters',
      'imageUrl':
      'https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?w=500',
    },
    {
      'id': '3',
      'title': 'Comforter Sets',
      'imageUrl':
      'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=500',
    },
    {
      'id': '4',
      'title': 'Dohars',
      'imageUrl':
      'https://images.unsplash.com/photo-1579656381226-5fc0f0100c3b?w=500',
    },
    {
      'id': '5',
      'title': 'Quilts',
      'imageUrl':
      'https://images.unsplash.com/photo-1616594039964-ae9021a400a0?w=500',
    },
    {
      'id': '6',
      'title': 'Cushion Covers',
      'imageUrl':
      'https://images.unsplash.com/photo-1582582494705-f829b3147879?w=500',
    },
    {
      'id': '7',
      'title': 'Curtains',
      'imageUrl':
      'https://images.unsplash.com/photo-1513519245088-0e12902e5a38?w=500',
    },
    {
      'id': '8',
      'title': 'Table Linen',
      'imageUrl':
      'https://images.unsplash.com/photo-1615874959474-d6099696fc52?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),

      // APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Color(0xFF1E293B),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.local_florist,
              color: Color(0xFF0066B2),
              size: 24,
            ),
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

      // BODY
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // HEADING
            Text(
              'Shop by Category',
              style: GoogleFonts.merriweather(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0F172A),
              ),
            ),

            const SizedBox(height: 6),

            // SUBTITLE
            Text(
              'Bring home the beauty of Indian handlooms.\n'
                  'Timeless textiles for a more meaningful, beautiful home.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: const Color(0xFF64748B),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 12),

            const Icon(
              Icons.local_florist,
              size: 16,
              color: Color(0xFF0066B2),
            ),

            const SizedBox(height: 20),

            // CATEGORY GRID
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: _categories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.82,
                ),

                itemBuilder: (context, index) {
                  final cat = _categories[index];

                  return GestureDetector(
                    onTap: () {
                      if (cat['title'] == 'Bedsheets') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const BedsheetsScreen(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const FiltersScreen(),
                          ),
                        );
                      }
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // CATEGORY IMAGE
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),

                              child: Image.network(
                                cat['imageUrl']!,
                                width: double.infinity,
                                fit: BoxFit.cover,

                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }

                                  return Container(
                                    color: const Color(0xFFE2E8F0),
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: Color(0xFF0066B2),
                                      ),
                                    ),
                                  );
                                },

                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return Container(
                                    width: double.infinity,
                                    color: Colors.grey.shade200,
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          // CATEGORY TITLE
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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

                                const Icon(
                                  Icons.chevron_right,
                                  size: 18,
                                  color: Color(0xFF64748B),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
