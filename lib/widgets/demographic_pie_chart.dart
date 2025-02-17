import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DemographicPieChart extends StatelessWidget {
  const DemographicPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 35,
            title: 'Turkish',
            color: Colors.blue,
            radius: 100,
          ),
          PieChartSectionData(
            value: 25,
            title: 'Kurdish',
            color: Colors.red,
            radius: 100,
          ),
          PieChartSectionData(
            value: 15,
            title: 'Arab',
            color: Colors.green,
            radius: 100,
          ),
          PieChartSectionData(
            value: 25,
            title: 'Other',
            color: Colors.orange,
            radius: 100,
          ),
        ],
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        startDegreeOffset: 270,
      ),
    );
  }
}
