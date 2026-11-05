import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'filters_screen.dart';

class BedsheetsScreen extends StatefulWidget {
  const BedsheetsScreen({super.key});

  @override
  State<BedsheetsScreen> createState() => _BedsheetsScreenState();
}

class _BedsheetsScreenState extends State<BedsheetsScreen> {
  String _selectedFilter = 'All';

  final _bedsheetsList = [
    {
      'id': '1',
      'title': 'Blue Mughal Bloom Bedsheet',
      'subtitle': 'Pure Cotton Handloom',
      'price': '1,899',
      'oldPrice': '2,499',
      'discount': '24% OFF',
      'rating': 4.8,
      'reviews': 124,
      'badge': 'Bestseller',
      'image': 'https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'id': '2',
      'title': 'Rajasthan Gulmohar Bedsheet',
      'subtitle': 'Hand Block Print • Pure Cotton',
      'price': '1,749',
      'oldPrice': '2,299',
      'discount': '24% OFF',
      'rating': 4.7,
      'reviews': 96,
      'badge': 'New',
      'image': 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'id': '3',
      'title': 'Indigo Trails Bedsheet',
      'subtitle': 'Handloom Cotton',
      'price': '2,099',
      'oldPrice': '2,799',
      'discount': '25% OFF',
      'rating': 4.6,
      'reviews': 88,
      'badge': '',
      'image': 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'id': '4',
      'title': 'Neem Greens Bedsheet',
      'subtitle': 'Hand Block Print • Pure Cotton',
      'price': '1,699',
      'oldPrice': '2,299',
      'discount': '26% OFF',
      'rating': 4.8,
      'reviews': 142,
      'badge': 'Bestseller',
      'image': 'https://images.unsplash.com/photo-1579656381226-5fc0f0100c3b?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'id': '5',
      'title': 'Pink Lotus Bedsheet',
      'subtitle': 'Handloom Cotton',
      'price': '1,899',
      'oldPrice': '2,599',
      'discount': '27% OFF',
      'rating': 4.7,
      'reviews': 76,
      'badge': '',
      'image': 'https://images.unsplash.com/photo-1513519245088-0e12902e5a38?q=80&w=1000&auto=format&fit=crop',
    },
    {
      'id': '6',
      'title': 'Monsoon Leaves Bedsheet',
      'subtitle': 'Hand Block Print • Pure Cotton',
      'price': '1,799',
      'oldPrice': '2,499',
      'discount': '28% OFF',
      'rating': 4.6,
      'reviews': 64,
      'badge': 'New',
      'image': 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?q=80&w=1000&auto=format&fit=crop',
    },
  ];

  final _categories = [
    {'title': 'All', 'image': 'https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?w=200'},
    {'title': 'Floral', 'image': 'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=200'},
    {'title': 'Block Print', 'image': 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=200'},
    {'title': 'Jaipur', 'image': 'https://images.unsplash.com/photo-1579656381226-5fc0f0100c3b?w=200'},
    {'title': 'Indigo', 'image': 'https://images.unsplash.com/photo-1513519245088-0e12902e5a38?w=200'},
    {'title': 'Minimal', 'image': 'https://images.unsplash.com/photo-1584100936595-c0654b55a2e2?w=200'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context), // Seamless back navigation
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.local_florist, color: Color(0xFF0066B2), size: 24),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HANDLOOM HAVEN',
                  style: GoogleFonts.merriweather(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                Text(
                  'ROOTED IN INDIA. MADE FOR HOME.',
                  style: GoogleFonts.inter(fontSize: 6.5, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF1E293B)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FiltersScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Text(
                'Home > Home Textiles > Bedsheets',
                style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF64748B)),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFE5F3FF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Handloom Bedsheets',
                    style: GoogleFonts.merriweather(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Breathe tradition into your home with our handloom bedsheets — crafted in pure, natural fabrics, woven by India\'s finest artisans.',
                    style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF475569), height: 1.4),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '52 products',
                    style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFF0066B2)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  final isSelected = _selectedFilter == cat['title'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilter = cat['title']!;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? const Color(0xFF0066B2) : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(cat['image']!),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cat['title']!,
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected ? const Color(0xFF0066B2) : const Color(0xFF1E293B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.sort, size: 16, color: Color(0xFF1E293B)),
                        const SizedBox(width: 6),
                        Text('Sort by', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500)),
                        const SizedBox(width: 4),
                        Text('Featured', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF0066B2))),
                        const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                  // Filters Button with Navigation to FiltersScreen
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FiltersScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.filter_list, size: 16, color: Color(0xFF1E293B)),
                          const SizedBox(width: 6),
                          Text('Filters', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500)),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(color: Color(0xFF0066B2), shape: BoxShape.circle),
                            child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                itemCount: _bedsheetsList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.56,
                ),
                itemBuilder: (context, index) {
                  final item = _bedsheetsList[index];
                  return Container(
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
                              child: Image.network(
                                item['image'].toString(),
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            if ((item['badge'] ?? '').toString().isNotEmpty)
                              Positioned(
                                left: 8,
                                top: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: item['badge'] == 'Bestseller' ? const Color(0xFF0066B2) : const Color(0xFF0EA5E9),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    item['badge'].toString(),
                                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
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
                              Text(
                                item['title'].toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A)),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item['subtitle'].toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(fontSize: 10, color: const Color(0xFF64748B)),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
                                  const SizedBox(width: 4),
                                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                                  const SizedBox(width: 4),
                                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.pinkAccent, shape: BoxShape.circle)),
                                  const SizedBox(width: 4),
                                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(Icons.star, size: 12, color: Colors.amber),
                                  const SizedBox(width: 4),
                                  Text('${item['rating']} (${item['reviews']})', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    '₹${item['price']}',
                                    style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A)),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '₹${item['oldPrice']}',
                                    style: GoogleFonts.inter(fontSize: 9, color: Colors.grey, decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item['discount'].toString(),
                                style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                              ),
                            ],
                          ),
                        ),
                      ],
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