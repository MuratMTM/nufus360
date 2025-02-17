import 'package:flutter/material.dart';
import 'package:nufus360/models/ethnic_group.dart';
import 'package:nufus360/services/data_service.dart';
import 'package:nufus360/widgets/ethnic_group_list.dart';
import 'package:nufus360/widgets/europe_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataService _dataService = DataService();
  String selectedCountry = 'Almanya';
  int selectedYear = 2024;
  List<String> europeanCountries = [];
  List<EthnicGroup> ethnicGroups = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final countries = await _dataService.getAvailableCountries();
    final groups = await _dataService.getEthnicGroups(selectedCountry, selectedYear);
    
    setState(() {
      europeanCountries = countries;
      ethnicGroups = groups;
    });
  }

  Future<void> _updateData() async {
    final groups = await _dataService.getEthnicGroups(selectedCountry, selectedYear);
    setState(() {
      ethnicGroups = groups;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Nüfus360 - Avrupa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Map Section
          SizedBox(
            height: 300,
            child: EuropeMap(
              selectedCountry: selectedCountry,
              onCountrySelected: (countryId) {
                // Convert country code to Turkish name
                final Map<String, String> countryNames = {
                  'DE': 'Almanya',
                  'FR': 'Fransa',
                  'ES': 'İspanya',
                  'IT': 'İtalya',
                  'PL': 'Polonya',
                  'RO': 'Romanya',
                  'NL': 'Hollanda',
                };
                
                final countryName = countryNames[countryId];
                if (countryName != null && countryName != selectedCountry) {
                  setState(() => selectedCountry = countryName);
                  _updateData();
                }
              },
            ),
          ),
          
          // Country and Year Selection Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: selectedCountry,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: europeanCountries
                          .map((country) => DropdownMenuItem(
                                value: country,
                                child: Text(country),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => selectedCountry = value);
                          _updateData();
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<int>(
                      value: selectedYear,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: List.generate(25, (index) => 2000 + index)
                          .map((year) => DropdownMenuItem(
                                value: year,
                                child: Text(year.toString()),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => selectedYear = value);
                          _updateData();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Ethnic Groups List with Chart
          Expanded(
            child: EthnicGroupList(
              ethnicGroups: ethnicGroups,
            ),
          ),
        ],
      ),
    );
  }
}
