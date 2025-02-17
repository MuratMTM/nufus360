import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EuropeMap extends StatefulWidget {
  final String? selectedCountry;
  final Function(String)? onCountrySelected;

  const EuropeMap({
    super.key,
    this.selectedCountry,
    this.onCountrySelected,
  });

  @override
  State<EuropeMap> createState() => _EuropeMapState();
}

class _EuropeMapState extends State<EuropeMap> {
  String? hoveredCountry;

  Color getCountryColor(String countryId) {
    if (hoveredCountry == countryId) {
      return const Color(0xFF2196F3); // Light blue when hovered
    }
    if (widget.selectedCountry == countryId) {
      return const Color(0xFF1976D2); // Darker blue when selected
    }
    return const Color(0xFFE6E6E6); // Default gray
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Background color
            Container(
              color: const Color(0xFFF5F5F5),
            ),
            // Map with interaction
            InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(20),
              minScale: 0.5,
              maxScale: 2.0,
              child: Center(
                child: SvgPicture.asset(
                  'assets/maps/europe.svg',
                  fit: BoxFit.contain,
                  // Override colors based on selection/hover state
                  colorFilter: ColorFilter.mode(
                    Colors.blue.withOpacity(0.1),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            // Interactive layer
            Positioned.fill(
              child: MouseRegion(
                onHover: (event) {
                  // Here you would determine which country is being hovered
                  // For now, we'll just use it for visual feedback
                  final RenderBox box = context.findRenderObject() as RenderBox;
                  final localPosition = box.globalToLocal(event.position);
                  // You would determine the country based on position
                },
                child: GestureDetector(
                  onTapUp: (details) {
                    if (widget.onCountrySelected != null) {
                      final RenderBox box = context.findRenderObject() as RenderBox;
                      final localPosition = box.globalToLocal(details.globalPosition);
                      
                      // For demonstration, let's select Germany when clicking in the center
                      final center = box.size.center(Offset.zero);
                      if ((localPosition - center).distance < 100) {
                        widget.onCountrySelected!('DE');
                      }
                    }
                  },
                ),
              ),
            ),
            // Country labels
            Positioned(
              right: 16,
              top: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ülkeler',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildCountryLabel('DE', 'Almanya'),
                  _buildCountryLabel('FR', 'Fransa'),
                  _buildCountryLabel('ES', 'İspanya'),
                  _buildCountryLabel('IT', 'İtalya'),
                  _buildCountryLabel('PL', 'Polonya'),
                  _buildCountryLabel('RO', 'Romanya'),
                  _buildCountryLabel('NL', 'Hollanda'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryLabel(String code, String name) {
    final isSelected = widget.selectedCountry == code;
    final isHovered = hoveredCountry == code;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: getCountryColor(code),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: TextStyle(
              color: isSelected || isHovered
                  ? const Color(0xFF1976D2)
                  : Colors.grey.shade700,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
