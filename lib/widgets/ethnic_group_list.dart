import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:nufus360/models/ethnic_group.dart';

class EthnicGroupList extends StatelessWidget {
  final List<EthnicGroup> ethnicGroups;

  const EthnicGroupList({
    super.key,
    required this.ethnicGroups,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Pie Chart Section
        Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          child: PieChart(
            PieChartData(
              sections: ethnicGroups.map((group) {
                final color = _getColorForEthnicGroup(group.name);
                return PieChartSectionData(
                  value: group.percentage,
                  title: '${group.percentage}%',
                  radius: 80,
                  titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  color: color,
                );
              }).toList(),
              sectionsSpace: 2,
              centerSpaceRadius: 0,
            ),
          ),
        ),
        
        // Ethnic Groups List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: ethnicGroups.length,
            itemBuilder: (context, index) {
              final group = ethnicGroups[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _getColorForEthnicGroup(group.name).withOpacity(0.8),
                      _getColorForEthnicGroup(group.name).withOpacity(0.6),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  leading: Text(
                    group.flag,
                    style: const TextStyle(fontSize: 24),
                  ),
                  title: Text(
                    group.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '%${group.percentage.toStringAsFixed(1)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getColorForEthnicGroup(String name) {
    switch (name) {
      case 'Alman':
        return const Color(0xFF1565C0);
      case 'Türk':
        return const Color(0xFFD32F2F);
      case 'Polonyalı':
        return const Color(0xFF7B1FA2);
      case 'Rus':
        return const Color(0xFF388E3C);
      case 'Diğer':
        return const Color(0xFF455A64);
      default:
        return Colors.grey;
    }
  }
}
