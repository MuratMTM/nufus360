import 'package:flutter/foundation.dart';
import 'package:nufus360/models/ethnic_group.dart';

class DataService extends ChangeNotifier {
  // Fetch ethnic group data for a specific country and year
  Future<List<EthnicGroup>> getEthnicGroups(String country, int year) async {
    // For now, return sample data. In the future, this could be expanded to load from a JSON file or API
    if (country == 'Almanya') {
      return sampleGermanEthnicGroups;
    }
    
    // Default empty data for other countries
    return [
      const EthnicGroup(
        name: 'Veri Yok',
        percentage: 100,
        countryCode: 'EU',
        flag: '🌍',
      ),
    ];
  }

  // Get available years for a specific country
  Future<List<int>> getAvailableYears(String country) async {
    // For now, return a fixed range of years
    return List.generate(25, (index) => 2000 + index);
  }

  // Get available countries
  Future<List<String>> getAvailableCountries() async {
    return [
      'Almanya',
      'Fransa',
      'İspanya',
      'İtalya',
      'Polonya',
      'Romanya',
      'Hollanda',
    ];
  }
}
