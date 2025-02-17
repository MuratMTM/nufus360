import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RegionBarChart extends StatelessWidget {
  const RegionBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 100,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const titles = ['Marmara', 'Ege', 'Akdeniz', 'İç Anadolu', 'Karadeniz', 'Doğu', 'G.Doğu'];
                if (value.toInt() < 0 || value.toInt() >= titles.length) {
                  return const SizedBox();
                }
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    titles[value.toInt()],
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text('${value.toInt()}M'),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        barGroups: [
          BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 85)]),
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 65)]),
          BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 55)]),
          BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 45)]),
          BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 35)]),
          BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 25)]),
          BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 15)]),
        ],
      ),
    );
  }
}
