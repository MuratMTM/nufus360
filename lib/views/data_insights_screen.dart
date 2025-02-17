import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:nufus360/widgets/demographic_pie_chart.dart';
import 'package:nufus360/widgets/population_line_chart.dart';
import 'package:nufus360/widgets/region_bar_chart.dart';

class DataInsightsScreen extends StatefulWidget {
  const DataInsightsScreen({super.key});

  @override
  State<DataInsightsScreen> createState() => _DataInsightsScreenState();
}

class _DataInsightsScreenState extends State<DataInsightsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _regions = ['Turkey', 'Europe', 'Asia', 'Global'];
  String _selectedRegion = 'Turkey';
  int _selectedYear = 2024;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Insights'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Demographics'),
            Tab(text: 'Population Trends'),
            Tab(text: 'Regional Analysis'),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedRegion,
                    isExpanded: true,
                    items: _regions
                        .map((region) => DropdownMenuItem(
                              value: region,
                              child: Text(region),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _selectedRegion = value);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<int>(
                    value: _selectedYear,
                    isExpanded: true,
                    items: List.generate(25, (index) => 2000 + index)
                        .map((year) => DropdownMenuItem(
                              value: year,
                              child: Text(year.toString()),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _selectedYear = value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Demographics Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ethnic Distribution in $_selectedRegion',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 16),
                              const SizedBox(
                                height: 300,
                                child: DemographicPieChart(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Population Trends Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Population Growth in $_selectedRegion',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 16),
                              const SizedBox(
                                height: 300,
                                child: PopulationLineChart(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Regional Analysis Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Regional Comparison ($_selectedYear)',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 16),
                              const SizedBox(
                                height: 300,
                                child: RegionBarChart(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
