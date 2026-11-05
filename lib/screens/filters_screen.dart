import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _priceRange = const RangeValues(500, 5000);

  bool _isSingle = false;
  bool _isDouble = false;
  bool _isQueen = true;
  bool _isKing = false;

  bool _isFloral = true;
  bool _isGeometric = false;
  bool _isTraditional = false;
  bool _isStripes = false;

  bool _is100Cotton = true;
  bool _isOrganicCotton = false;
  bool _isCottonBlend = false;

  bool _isInStock = true;
  bool _isOutOfStock = false;

  int _selectedColorIndex = 5; // Default blue selected

  final List<Color> _colors = [
    const Color(0xFFF5EBE6),
    const Color(0xFFD7CCC8),
    const Color(0xFFE8D7D7),
    const Color(0xFF8F9E8B),
    const Color(0xFF90CAF9),
    const Color(0xFF0D47A1),
    const Color(0xFF8E6B7B),
    const Color(0xFFD4AC0D),
    const Color(0xFF9E9E9E),
    const Color(0xFFBCAAA4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.local_florist, color: Color(0xFF0066B2), size: 18),
                const SizedBox(width: 6),
                Text(
                  'HANDLOOM HAVEN',
                  style: GoogleFonts.merriweather(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
            Text(
              'ROOTED IN INDIAN TEXTILES',
              style: GoogleFonts.inter(fontSize: 6.5, color: Colors.grey, letterSpacing: 1.0),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                _priceRange = const RangeValues(500, 5000);
                _isQueen = false;
                _isFloral = false;
                _is100Cotton = false;
                _isInStock = false;
              });
            },
            icon: const Icon(Icons.delete_outline, size: 16, color: Color(0xFF0066B2)),
            label: Text(
              'Clear All',
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF0066B2)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filters',
              style: GoogleFonts.merriweather(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '52 products match your filters',
              style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B)),
            ),
            const SizedBox(height: 12),

            // Active Filter Chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildFilterChip('Queen', true),
                _buildFilterChip('Cotton', true),
                _buildFilterChip('Blue', true),
                _buildFilterChip('Floral', true),
              ],
            ),
            const SizedBox(height: 20),

            // Category Section
            _buildAccordionSection(
              title: 'Category',
              subtitle: 'Bedsheets',
              initiallyExpanded: true,
            ),
            const Divider(height: 30),

            // Price Range Section
            ExpansionTile(
              initiallyExpanded: true,
              tilePadding: EdgeInsets.zero,
              title: Text('Price Range', style: GoogleFonts.merriweather(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
              subtitle: Text('₹${_priceRange.start.round()} – ₹${_priceRange.end.round()}', style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF0066B2), fontWeight: FontWeight.w600)),
              children: [
                RangeSlider(
                  values: _priceRange,
                  min: 500,
                  max: 10000,
                  divisions: 19,
                  activeColor: const Color(0xFF0066B2),
                  inactiveColor: Colors.grey.shade300,
                  labels: RangeLabels(
                    '₹${_priceRange.start.round()}',
                    '₹${_priceRange.end.round()}',
                  ),
                  onChanged: (values) {
                    setState(() {
                      _priceRange = values;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Text('₹ ${_priceRange.start.round()}', style: GoogleFonts.inter(fontSize: 14)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text('–', style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Text('₹ ${_priceRange.end.round()}', style: GoogleFonts.inter(fontSize: 14)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 30),

            // Size Section
            ExpansionTile(
              initiallyExpanded: true,
              tilePadding: EdgeInsets.zero,
              title: Text('Size', style: GoogleFonts.merriweather(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 4.5,
                  children: [
                    CheckboxListTile(
                      title: const Text('Single'),
                      value: _isSingle,
                      onChanged: (val) => setState(() => _isSingle = val!),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    CheckboxListTile(
                      title: const Text('Double'),
                      value: _isDouble,
                      onChanged: (val) => setState(() => _isDouble = val!),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    CheckboxListTile(
                      title: const Text('Queen'),
                      value: _isQueen,
                      onChanged: (val) => setState(() => _isQueen = val!),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    CheckboxListTile(
                      title: const Text('King'),
                      value: _isKing,
                      onChanged: (val) => setState(() => _isKing = val!),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 30),

            // Colour Section
            ExpansionTile(
              initiallyExpanded: true,
              tilePadding: EdgeInsets.zero,
              title: Text('Colour', style: GoogleFonts.merriweather(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _colors.length,
                    itemBuilder: (context, index) {
                      final isSelected = _selectedColorIndex == index;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedColorIndex = index),
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: _colors[index],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? const Color(0xFF0066B2) : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            const Divider(height: 30),

            // Pattern Section
            ExpansionTile(
              initiallyExpanded: true,
              tilePadding: EdgeInsets.zero,
              title: Text('Pattern', style: GoogleFonts.merriweather(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 4.5,
                  children: [
                    CheckboxListTile(title: const Text('Floral'), value: _isFloral, onChanged: (v) => setState(() => _isFloral = v!), controlAffinity: ListTileControlAffinity.leading, contentPadding: EdgeInsets.zero),
                    CheckboxListTile(title: const Text('Geometric'), value: _isGeometric, onChanged: (v) => setState(() => _isGeometric = v!), controlAffinity: ListTileControlAffinity.leading, contentPadding: EdgeInsets.zero),
                    CheckboxListTile(title: const Text('Traditional'), value: _isTraditional, onChanged: (v) => setState(() => _isTraditional = v!), controlAffinity: ListTileControlAffinity.leading, contentPadding: EdgeInsets.zero),
                    CheckboxListTile(title: const Text('Stripes'), value: _isStripes, onChanged: (v) => setState(() => _isStripes = v!), controlAffinity: ListTileControlAffinity.leading, contentPadding: EdgeInsets.zero),
                  ],
                ),
              ],
            ),
            const Divider(height: 30),

            // Material Section
            ExpansionTile(
              initiallyExpanded: true,
              tilePadding: EdgeInsets.zero,
              title: Text('Material', style: GoogleFonts.merriweather(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 4.2,
                  children: [
                    CheckboxListTile(title: const Text('100% Cotton'), value: _is100Cotton, onChanged: (v) => setState(() => _is100Cotton = v!), controlAffinity: ListTileControlAffinity.leading, contentPadding: EdgeInsets.zero),
                    CheckboxListTile(title: const Text('Organic Cotton'), value: _isOrganicCotton, onChanged: (v) => setState(() => _isOrganicCotton = v!), controlAffinity: ListTileControlAffinity.leading, contentPadding: EdgeInsets.zero),
                    CheckboxListTile(title: const Text('Cotton Blend'), value: _isCottonBlend, onChanged: (v) => setState(() => _isCottonBlend = v!), controlAffinity: ListTileControlAffinity.leading, contentPadding: EdgeInsets.zero),
                  ],
                ),
              ],
            ),
            const Divider(height: 30),

            // Availability Section
            ExpansionTile(
              initiallyExpanded: true,
              tilePadding: EdgeInsets.zero,
              title: Text('Availability', style: GoogleFonts.merriweather(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 4.5,
                  children: [
                    CheckboxListTile(title: const Text('In Stock'), value: _isInStock, onChanged: (v) => setState(() => _isInStock = v!), controlAffinity: ListTileControlAffinity.leading, contentPadding: EdgeInsets.zero),
                    CheckboxListTile(title: const Text('Out of Stock'), value: _isOutOfStock, onChanged: (v) => setState(() => _isOutOfStock = v!), controlAffinity: ListTileControlAffinity.leading, contentPadding: EdgeInsets.zero),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -5)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0066B2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Show 52 Products', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _isQueen = false;
                    _isFloral = false;
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF0066B2)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text('Clear', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF0066B2))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Chip(
      label: Text(label, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF0066B2), fontWeight: FontWeight.w500)),
      backgroundColor: const Color(0xFFE5F3FF),
      deleteIcon: const Icon(Icons.close, size: 14, color: Color(0xFF0066B2)),
      onDeleted: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
    );
  }

  Widget _buildAccordionSection({required String title, required String subtitle, required bool initiallyExpanded}) {
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      tilePadding: EdgeInsets.zero,
      title: Text(title, style: GoogleFonts.merriweather(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
      subtitle: Text(subtitle, style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF64748B), fontWeight: FontWeight.w500)),
      children: const [],
    );
  }
}